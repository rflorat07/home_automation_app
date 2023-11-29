import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/shared_providers.dart';
import '../../data/models/device.model.dart';
import '../providers/add_device_providers.dart';
import '../providers/device_providers.dart';

class DeviceToggleViewModel extends StateNotifier<bool> {
  final Ref ref;

  DeviceToggleViewModel(super.state, this.ref);

  Future<void> toggleDevice(DeviceModel selectedDevice) async {
    state = true;

    if (selectedDevice.outlet >= 0) {
      await Future.delayed(500.milliseconds);
      final response = await ref
          .read(deviceHttpServiceFutureProvider(selectedDevice).future);

      if (response.success) {
        ref.read(deviceListVMProvider.notifier).toggleDevice(selectedDevice);
        ref.read(saveAddDeviceVMProvider.notifier).saveDeviceList();
      }
    }

    state = false;
  }
}
