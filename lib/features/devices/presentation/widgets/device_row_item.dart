import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';
import '../../../shared/widgets/flicky_animated_icons.dart';
import '../../data/models/device.model.dart';

class DeviceRowItem extends StatelessWidget {
  final DeviceModel device;
  final Function onTapDevice;

  const DeviceRowItem({
    super.key,
    required this.device,
    required this.onTapDevice,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = device.isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.secondary;

    final bgColor = selectedColor.withOpacity(0.15);
    final splashColor = selectedColor.withOpacity(0.25);

    return Container(
      margin: const EdgeInsets.only(bottom: HomeAutomationStyles.smallSize),
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(HomeAutomationStyles.smallRadius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            onTapDevice(device);
          },
          splashColor: splashColor,
          highlightColor: splashColor,
          child: Padding(
            padding: HomeAutomationStyles.mediumPadding,
            child: Row(
              children: [
                FlickyAnimatedIcons(
                  icon: device.iconOption,
                  isSelected: device.isSelected,
                ),
                HomeAutomationStyles.smallHGap,
                Expanded(
                  child: Text(
                    device.label,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: selectedColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
