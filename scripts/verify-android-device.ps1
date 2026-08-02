$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$evidenceDir = Join-Path $repoRoot "evidence/device"
New-Item -ItemType Directory -Path $evidenceDir -Force | Out-Null

function Require-Command([string]$name) {
  $command = Get-Command $name -ErrorAction SilentlyContinue
  if (-not $command) {
    throw "Required command '$name' was not found on PATH."
  }
  return $command.Source
}

$nodePath = Require-Command "node"
$npmPath = Require-Command "npm"
$adbPath = Require-Command "adb"

$nodeVersion = (& node --version).Trim()
$npmVersion = (& npm --version).Trim()
$adbVersion = (& adb version | Select-Object -First 1).Trim()

$devices = @(& adb devices | Select-Object -Skip 1 | Where-Object { $_ -match "\S" })
$authorized = @($devices | Where-Object { $_ -match "\tdevice$" })
$unauthorized = @($devices | Where-Object { $_ -match "\tunauthorized$" })

if ($unauthorized.Count -gt 0) {
  throw "Android device detected but not authorized. Unlock the phone and accept the USB debugging prompt."
}

if ($authorized.Count -ne 1) {
  throw "Expected exactly one authorized Android device; found $($authorized.Count)."
}

$serial = ($authorized[0] -split "\s+")[0]

function Get-Prop([string]$name) {
  return (& adb -s $serial shell getprop $name).Trim()
}

$report = [ordered]@{
  capturedAtUtc = (Get-Date).ToUniversalTime().ToString("o")
  proofState = "device-detected-build-not-yet-verified"
  workstation = [ordered]@{
    node = $nodeVersion
    npm = $npmVersion
    adb = $adbVersion
    nodePath = $nodePath
    npmPath = $npmPath
    adbPath = $adbPath
  }
  device = [ordered]@{
    serialHash = ([Convert]::ToHexString([Security.Cryptography.SHA256]::HashData([Text.Encoding]::UTF8.GetBytes($serial)))).ToLowerInvariant()
    manufacturer = Get-Prop "ro.product.manufacturer"
    model = Get-Prop "ro.product.model"
    device = Get-Prop "ro.product.device"
    androidVersion = Get-Prop "ro.build.version.release"
    sdk = Get-Prop "ro.build.version.sdk"
    abi = Get-Prop "ro.product.cpu.abi"
    buildFingerprint = Get-Prop "ro.build.fingerprint"
  }
  assertions = [ordered]@{
    exactlyOneAuthorizedDevice = $true
    targetModelExpected = ((Get-Prop "ro.product.model") -eq "SM-A065M")
    android12OrLater = ([int](Get-Prop "ro.build.version.sdk") -ge 31)
  }
  exclusions = @(
    "No APK build was verified by this script.",
    "No QVAC model was loaded.",
    "No local inference was proven.",
    "No health or personal data was collected."
  )
}

$outputPath = Join-Path $evidenceDir "device-report.json"
$report | ConvertTo-Json -Depth 6 | Set-Content -Path $outputPath -Encoding utf8

Write-Host "Android device proof written to $outputPath"
Write-Host "Model: $($report.device.model)"
Write-Host "Android: $($report.device.androidVersion) (SDK $($report.device.sdk))"
Write-Host "ABI: $($report.device.abi)"
Write-Host "Target model match: $($report.assertions.targetModelExpected)"
