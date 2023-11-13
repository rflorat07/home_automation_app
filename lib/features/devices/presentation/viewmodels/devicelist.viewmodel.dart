import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../helpers/utils.dart';
import '../../data/models/device.model.dart';
import '../pages/device_details.page.dart';
import '../providers/device_providers.dart';

class DeviceListViewModel extends StateNotifier<List<DeviceModel>> {
  final Ref ref;

  DeviceListViewModel(super.state, this.ref);

  void initializeState(List<DeviceModel> devices) {
    state = devices;
  }

  void showDeviceDetails(DeviceModel device) {
    ref.read(selectedDeviceProvider.notifier).state = device;
    GoRouter.of(Utils.mainNav.currentContext!).push(DeviceDetailsPage.roure);
  }

  void toggleDevice(DeviceModel selectedDevice) {
    state = [
      for (final device in state)
        if (device == selectedDevice)
          device.copyWith(isSelected: !device.isSelected)
        else
          device
    ];

    ref.read(selectedDeviceProvider.notifier).state =
        state.where((d) => d.outlet == selectedDevice.outlet).first;
  }
}
