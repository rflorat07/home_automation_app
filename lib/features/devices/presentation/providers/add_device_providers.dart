import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/device.model.dart';
import '../../data/repositories/device_types.repository.dart';
import '../viewmodels/add_device_type.viewmodel.dart';

final deviceTypeListProvider = Provider((ref) {
  return DeviceTypesRepository();
});

final deviceTypeSelectionVMProvider =
    StateNotifierProvider<AddDeviceTypeViewModel, List<DeviceModel>>(
  (ref) {
    final deviceTypeList = ref.read(deviceTypeListProvider).getDeviceTypeList();
    return AddDeviceTypeViewModel(deviceTypeList);
  },
);
