// lib/core/providers/core_providers.dart
//
// Uygulamanın temel altyapı provider'ları.
// Tüm feature modülleri buradan import eder — tersine bağımlılık olmaz.
//
// main.dart'ta ProviderScope.overrides ile enjekte edilmeli:
//
//   final prefs = await SharedPreferences.getInstance();
//   runApp(
//     ProviderScope(
//       overrides: [
//         sharedPreferencesProvider.overrideWithValue(prefs),
//       ],
//       child: const ECommerceApp(),
//     ),
//   );

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Tüm feature provider'larının ortak bağımlılığı.
/// main.dart'ta override edilmeden kullanılırsa UnimplementedError fırlatır.
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError(
    'sharedPreferencesProvider, main.dart\'ta ProviderScope.overrides ile '
    'override edilmeli.',
  ),
);