import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/device.model.dart';
import '../../data/repositories/devices.repository.dart';
import '../viewmodels/devicelist.viewmodel.dart';

final devicesRepositoryProvider = Provider((ref) {
  return DevicesRepository(ref);
});

final deviceListVMProvider =
    StateNotifierProvider<DeviceListViewModel, List<DeviceModel>>((ref) {
  return DeviceListViewModel([], ref);
});
