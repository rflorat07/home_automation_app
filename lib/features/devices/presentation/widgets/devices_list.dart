import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../styles/styles.dart';
import '../../../shared/widgets/warning_message.dart';
import '../providers/device_providers.dart';
import 'device_row_item.dart';

class DevicesList extends ConsumerWidget {
  const DevicesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicesList = ref.watch(deviceListVMProvider);

    return devicesList.isNotEmpty
        ? ListView.builder(
            itemCount: devicesList.length,
            padding: HomeAutomationStyles.mediumPadding,
            itemBuilder: (context, index) {
              return DeviceRowItem(
                device: devicesList[index],
                onTapDevice: (selectedDevice) {
                  ref
                      .read(deviceListVMProvider.notifier)
                      .showDeviceDetails(selectedDevice);
                },
              )
                  .animate(
                    delay: (index * 0.125).seconds,
                  )
                  .slideY(
                    begin: 0.5,
                    end: 0,
                    duration: 0.5.seconds,
                    curve: Curves.easeInOut,
                  )
                  .fadeIn(
                    duration: 0.5.seconds,
                    curve: Curves.easeInOut,
                  );
            },
          )
        : const WarningMessage(message: 'No available devices');
  }
}
