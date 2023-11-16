import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helpers/enums.dart';
import '../providers/add_device_providers.dart';

class AddDeviceSaveViewModel extends StateNotifier<AddDeviceStates> {
  final Ref ref;

  AddDeviceSaveViewModel(super.state, this.ref);

  Future<void> saveDevice() {
    return Future.value();
  }

  Future<bool> saveDeviceList() {
    return Future.value(true);
  }

  void resetAllValues() {
    state = AddDeviceStates.none;

    ref.read(deviceNameFieldProvider).clear();
    ref.read(deviceNameValueProvider.notifier).state = '';
    ref.read(outletValueProvider.notifier).state = null;
    final rawList = ref.read(deviceTypeListProvider).getDeviceTypeList();
    ref.read(deviceTypeSelectionVMProvider.notifier).state = rawList;
  }
}
