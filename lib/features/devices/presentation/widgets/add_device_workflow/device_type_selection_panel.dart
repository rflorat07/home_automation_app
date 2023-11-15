import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../helpers/enums.dart';
import '../../../../../styles/styles.dart';
import '../../../../shared/widgets/flicky_animated_icons.dart';
import '../../providers/add_device_providers.dart';

class DeviceTypeSelectionPanel extends ConsumerWidget {
  const DeviceTypeSelectionPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceTypes = ref.watch(deviceTypeSelectionVMProvider);
    return SizedBox(
      height: 145,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: HomeAutomationStyles.smallSize),
        scrollDirection: Axis.horizontal,
        itemCount: deviceTypes.length,
        itemBuilder: (context, index) {
          final deviceItem = deviceTypes[index];

          var textTheme = Theme.of(context).textTheme;
          var colorScheme = Theme.of(context).colorScheme;

          var selectedColor = colorScheme.primary;
          var nonSelectedColor = colorScheme.secondary;
          var bgColor = deviceItem.isSelected
              ? selectedColor.withOpacity(0.25)
              : nonSelectedColor.withOpacity(0.25);
          var labelColor =
              deviceItem.isSelected ? selectedColor : nonSelectedColor;

          return Container(
            padding:
                const EdgeInsets.only(right: HomeAutomationStyles.smallSize),
            child: Material(
              color: bgColor,
              clipBehavior: Clip.antiAlias,
              borderRadius:
                  BorderRadius.circular(HomeAutomationStyles.smallRadius),
              child: InkWell(
                onTap: () {
                  ref
                      .read(deviceTypeSelectionVMProvider.notifier)
                      .onSelectedDeviceType(deviceItem);
                },
                child: Padding(
                  padding: HomeAutomationStyles.mediumPadding,
                  child: SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FlickyAnimatedIcons(
                          icon: deviceItem.iconOption,
                          size: FlickyAnimatedIconSizes.medium,
                          isSelected: deviceItem.isSelected,
                        ),
                        HomeAutomationStyles.xsmallVGap,
                        Text(
                          deviceItem.label,
                          style: textTheme.labelMedium!.copyWith(
                            color: labelColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
