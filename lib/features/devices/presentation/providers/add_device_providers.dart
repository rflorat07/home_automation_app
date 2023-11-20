import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helpers/enums.dart';
import '../../data/models/device.model.dart';
import '../../data/models/outlet.model.dart';
import '../../data/repositories/device_types.repository.dart';
import '../../data/repositories/outlets.repository.dart';
import '../viewmodels/add_device_save.viewmodel.dart';
import '../viewmodels/add_device_type.viewmodel.dart';
import '../viewmodels/outletlist.viewmodel.dart';
import 'device_providers.dart';

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

final outletListVMProvider =
    StateNotifierProvider<OutletListViewModel, List<OutletModel>>((ref) {
  return OutletListViewModel([], ref);
});

final outletListRepositoryProvider = Provider((ref) {
  return OutletsRepository();
});

final outletListFutureProvider = FutureProvider<bool>((ref) async {
  try {
    final outletList =
        await ref.read(outletListRepositoryProvider).getAvailableOutlets();
    ref.read(outletListVMProvider.notifier).initializeList(outletList);
    return true;
  } on Exception {
    return false;
  }
});

final outletValueProvider = StateProvider<OutletModel?>((ref) {
  return null;
});

final deviceNameFieldProvider = Provider((ref) {
  return TextEditingController();
});

final deviceExistsValidatorProvider = Provider((ref) {
  var deviceName = ref.watch(deviceNameValueProvider);
  return ref.read(deviceListVMProvider.notifier).deviceExists(deviceName);
});

final deviceNameValueProvider = StateProvider<String>((ref) => '');

final formValidatorProvider = Provider<bool>((ref) {
  var deviceName = ref.watch(deviceNameValueProvider);
  var outlet = ref.watch(outletValueProvider);
  var deviceTypes = ref.watch(deviceTypeSelectionVMProvider);
  var deviceTypeSelected = deviceTypes.any((d) => d.isSelected);
  var deviceDoesNotExist =
      !ref.read(deviceListVMProvider.notifier).deviceExists(deviceName);

  var isFormValid = deviceName.isNotEmpty &&
      deviceDoesNotExist &&
      deviceTypeSelected &&
      outlet != null;

  return isFormValid;
});

final saveAddDeviceVMProvider =
    StateNotifierProvider<AddDeviceSaveViewModel, AddDeviceStates>((ref) {
  return AddDeviceSaveViewModel(AddDeviceStates.none, ref);
});
