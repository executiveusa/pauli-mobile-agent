$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$appPath = Join-Path $repoRoot "apps/mobile"

if (Test-Path $appPath) {
  throw "apps/mobile already exists. Inspect it before replacing anything."
}

node --version
npm --version

Push-Location $repoRoot
try {
  npx create-expo-app@latest apps/mobile --template blank-typescript

  Push-Location $appPath
  try {
    npx expo install expo-build-properties expo-application expo-device expo-file-system expo-network expo-secure-store
    npm install @qvac/sdk
  }
  finally {
    Pop-Location
  }

  Copy-Item (Join-Path $repoRoot "templates/mobile/App.tsx") (Join-Path $appPath "App.tsx") -Force
  Copy-Item (Join-Path $repoRoot "templates/mobile/app.json") (Join-Path $appPath "app.json") -Force

  Write-Host "Mobile scaffold created at apps/mobile."
  Write-Host "Next: inspect generated versions, run npm install, then npx expo prebuild --platform android."
}
finally {
  Pop-Location
}
