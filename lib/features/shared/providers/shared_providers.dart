import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/localstorage.service.dart';

final sharedPrefsInstanceProvider = Provider((ref) {
  return SharedPreferences.getInstance();
});

final sharedPrefsLoadersProvider =
    FutureProvider<SharedPreferences>((ref) async {
  final prefs = await ref.read(sharedPrefsInstanceProvider);
  return prefs;
});

final localStorageProvider = Provider((ref) {
  return LocalStorageService(ref);
});
