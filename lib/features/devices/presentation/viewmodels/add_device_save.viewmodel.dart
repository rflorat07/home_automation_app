import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../helpers/enums.dart';
import '../../../../helpers/utils.dart';
import '../../data/models/device.model.dart';
import '../providers/add_device_providers.dart';
import '../providers/device_providers.dart';

class AddDeviceSaveViewModel extends StateNotifier<AddDeviceStates> {
  final Ref ref;

  AddDeviceSaveViewModel(super.state, this.ref);

  Future<void> saveDevice() async {
    state = AddDeviceStates.saving;
    await Future.delayed(const Duration(seconds: 1));

    // collect the info
    final label = ref.read(deviceNameValueProvider);
    final outlet = ref.read(outletValueProvider);
    final deviceType = ref
        .read(deviceTypeSelectionVMProvider.notifier)
        .getSelectedDeviceType();

    // add device
    ref.read(deviceListVMProvider.notifier).addDevice(
          DeviceModel(
            iconOption: deviceType.iconOption,
            label: label,
            isSelected: false,
            outlet: int.parse(outlet!.id),
          ),
        );

    final saveSuccess = await saveDeviceList();

    if (saveSuccess) {
      await Future.delayed(const Duration(seconds: 1));
      state = AddDeviceStates.saved;

      await Future.delayed(const Duration(seconds: 1));
      GoRouter.of(Utils.mainNav.currentContext!).pop();
    } else {
      state = AddDeviceStates.error;
    }

    await Future.delayed(const Duration(seconds: 1));
    state = AddDeviceStates.saved;

    await Future.delayed(const Duration(seconds: 1));
    GoRouter.of(Utils.mainNav.currentContext!).pop();
  }

  saveDeviceList() async {
    try {
      await Future.delayed(1.seconds);
      final updatedList = ref.read(deviceListVMProvider);
      ref.read(deviceRepositoryProvider).saveDeviceList(updatedList);
      return Future.value(true);
    } on Exception {
      return Future.value(false);
    }
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
