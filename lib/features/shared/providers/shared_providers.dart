import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../devices/data/models/device.model.dart';
import '../models/device_response.model.dart';
import '../services/devicehttp.service.dart';
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

final deviceHttpServiceProvider = Provider((ref) {
  return DeviceHttpService(ref: ref);
});

final deviceHttpServiceFutureProvider =
    FutureProvider.family<DeviceResponse, DeviceModel>(
        (ref, DeviceModel device) async {
  if (device.outlet >= 0) {
    final response =
        await ref.read(deviceHttpServiceProvider).toggleDevice(device);

    return response;
  }

  return DeviceResponse(statusCode: 0, success: false);
});
