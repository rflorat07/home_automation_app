import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helpers/enums.dart';
import '../../../../styles/styles.dart';
import '../../../shared/widgets/flicky_animated_icons.dart';
import '../providers/device_providers.dart';

class DeviceDetailsPanel extends ConsumerWidget {
  const DeviceDetailsPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDeviceSaving = ref.watch(deviceToggleVMProvider);
    final deviceData = ref.watch(selectedDeviceProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (deviceData == null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.bolt,
            size: HomeAutomationStyles.largeIconSize,
            color: colorScheme.secondary,
          ),
          Text(
            'Select Device',
            style: textTheme.labelLarge!.copyWith(color: colorScheme.secondary),
          )
        ],
      );
    }

    final selectionColor =
        deviceData.isSelected ? colorScheme.primary : colorScheme.secondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(HomeAutomationStyles.smallRadius),
                color: selectionColor.withOpacity(0.125)),
            child: Center(
              child: Padding(
                padding: HomeAutomationStyles.smallPadding,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FlickyAnimatedIcons(
                              icon: deviceData.iconOption,
                              size: FlickyAnimatedIconSizes.x2large,
                              isSelected: deviceData.isSelected,
                            ),
                            Text(
                              deviceData.label,
                              style: textTheme.headlineMedium!
                                  .copyWith(color: selectionColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: isDeviceSaving
                          ? const Padding(
                              padding: HomeAutomationStyles.largePadding,
                              child: Center(
                                child: SizedBox(
                                  width: HomeAutomationStyles.largeIconSize,
                                  height: HomeAutomationStyles.largeIconSize,
                                  child: CircularProgressIndicator(
                                    strokeWidth: HomeAutomationStyles.smallSize,
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                ref
                                    .read(deviceToggleVMProvider.notifier)
                                    .toggleDevice(deviceData);
                              },
                              child: Icon(
                                deviceData.isSelected
                                    ? Icons.toggle_on
                                    : Icons.toggle_off,
                                color: selectionColor,
                                size: HomeAutomationStyles.x2largeIconSize,
                              ),
                            ),
                    ),
                  ]
                      .animate(
                        interval: 100.ms,
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
                      ),
                ),
              ),
            ),
          ),
        ),
        HomeAutomationStyles.mediumVGap,
        ElevatedButton(
          onPressed: !deviceData.isSelected && !isDeviceSaving
              ? () {
                  ref
                      .read(deviceListVMProvider.notifier)
                      .removeDevice(deviceData);
                }
              : null,
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context)
                .colorScheme
                .tertiary, // change background color of button
            backgroundColor: Theme.of(context)
                .colorScheme
                .primary, // change text color of button
          ),
          child: const Text('Remove This Device'),
        ),
      ],
    );
  }
}
