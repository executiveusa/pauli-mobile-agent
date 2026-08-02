import { useEffect, useState } from 'react';
import { SafeAreaView, ScrollView, StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import * as Application from 'expo-application';
import * as Device from 'expo-device';
import * as Network from 'expo-network';

type MemoryState = 'idle' | 'capturing' | 'remembered' | 'recalled' | 'forgotten';

export default function App() {
  const [memoryState, setMemoryState] = useState<MemoryState>('idle');
  const [networkType, setNetworkType] = useState('checking');

  useEffect(() => {
    Network.getNetworkStateAsync()
      .then((state) => setNetworkType(`${state.type ?? 'unknown'} / connected=${Boolean(state.isConnected)}`))
      .catch(() => setNetworkType('unavailable'));
  }, []);

  const remember = () => {
    setMemoryState('capturing');
    setTimeout(() => setMemoryState('remembered'), 350);
  };

  return (
    <SafeAreaView style={styles.safe}>
      <ScrollView contentContainerStyle={styles.container}>
        <Text style={styles.eyebrow}>PAULI LIFEOS · PHASE 1</Text>
        <Text style={styles.title}>Private memory, controlled by you.</Text>
        <Text style={styles.body}>
          This shell proves the user flow only. Vision, speech, encryption, QVAC inference, and verified deletion are not connected yet.
        </Text>

        <View style={styles.card}>
          <Text style={styles.cardTitle}>Device profile</Text>
          <Text style={styles.row}>Device: {Device.modelName ?? 'unknown'}</Text>
          <Text style={styles.row}>Android: {Device.osVersion ?? 'unknown'}</Text>
          <Text style={styles.row}>App ID: {Application.applicationId ?? 'unknown'}</Text>
          <Text style={styles.row}>Network: {networkType}</Text>
        </View>

        <View style={styles.card}>
          <Text style={styles.cardTitle}>Memory loop</Text>
          <Text style={styles.state}>State: {memoryState}</Text>
          <TouchableOpacity style={styles.primary} onPress={remember} accessibilityRole="button">
            <Text style={styles.primaryText}>Remember this</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.secondary} onPress={() => setMemoryState('recalled')} accessibilityRole="button">
            <Text style={styles.secondaryText}>Recall</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.danger} onPress={() => setMemoryState('forgotten')} accessibilityRole="button">
            <Text style={styles.dangerText}>Forget</Text>
          </TouchableOpacity>
        </View>

        <View style={styles.warning}>
          <Text style={styles.warningText}>PROOF STATE: UNVERIFIED PROTOTYPE</Text>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: '#0b0d10' },
  container: { padding: 24, gap: 18 },
  eyebrow: { color: '#9ea7b3', fontSize: 12, letterSpacing: 1.5 },
  title: { color: '#ffffff', fontSize: 34, fontWeight: '700' },
  body: { color: '#c7ced8', fontSize: 16, lineHeight: 24 },
  card: { backgroundColor: '#151922', borderRadius: 18, padding: 18, gap: 10 },
  cardTitle: { color: '#ffffff', fontSize: 20, fontWeight: '700' },
  row: { color: '#c7ced8', fontSize: 14 },
  state: { color: '#ffffff', fontSize: 16, marginBottom: 6 },
  primary: { backgroundColor: '#ffffff', padding: 16, borderRadius: 12, alignItems: 'center' },
  primaryText: { color: '#0b0d10', fontWeight: '700' },
  secondary: { borderWidth: 1, borderColor: '#6f7b8a', padding: 16, borderRadius: 12, alignItems: 'center' },
  secondaryText: { color: '#ffffff', fontWeight: '700' },
  danger: { borderWidth: 1, borderColor: '#a85f5f', padding: 16, borderRadius: 12, alignItems: 'center' },
  dangerText: { color: '#f2b2b2', fontWeight: '700' },
  warning: { borderWidth: 1, borderColor: '#b89443', padding: 14, borderRadius: 12 },
  warningText: { color: '#e4c676', fontWeight: '700', textAlign: 'center' }
});
