import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/device.model.dart';
import '../../data/repositories/devices.repository.dart';
import '../viewmodels/device_toggle.viewmodel.dart';
import '../viewmodels/devicelist.viewmodel.dart';

final deviceRepositoryProvider = Provider((ref) {
  return DevicesRepository(ref);
});

final deviceListVMProvider =
    StateNotifierProvider<DeviceListViewModel, List<DeviceModel>>((ref) {
  return DeviceListViewModel([], ref);
});

final selectedDeviceProvider = StateProvider<DeviceModel?>((ref) {
  return null;
});

final deviceToggleVMProvider =
    StateNotifierProvider<DeviceToggleViewModel, bool>((ref) {
  return DeviceToggleViewModel(false, ref);
});
