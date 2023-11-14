import 'package:flutter/material.dart';

import '../../../../../styles/styles.dart';
import 'device_type_selection_panel.dart';

class AddDeviceForm extends StatelessWidget {
  const AddDeviceForm({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: HomeAutomationStyles.largePadding.copyWith(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.add_circle_outline,
                size: HomeAutomationStyles.mediumIconSize,
                color: colorScheme.primary,
              ),
              HomeAutomationStyles.smallHGap,
              Text(
                'Add New Device',
                style: textTheme.headlineSmall!.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          HomeAutomationStyles.smallVGap,
          Container(
            padding: HomeAutomationStyles.smallPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                HomeAutomationStyles.xsmallRadius,
              ),
              color: colorScheme.secondary.withOpacity(0.25),
            ),
            child: TextFormField(
              controller: TextEditingController(),
              style: textTheme.displayMedium,
              decoration: InputDecoration(
                errorText: null, //'Device name already exists',
                errorStyle: TextStyle(fontSize: 10, color: colorScheme.primary),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.primary,
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.primary,
                  ),
                ),
              ),
              onChanged: (value) {
                // capture device name here
              },
            ),
          ),
          HomeAutomationStyles.largeVGap,
          Text(
            'Type of Device',
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          HomeAutomationStyles.mediumVGap,
          const DeviceTypeSelectionPanel(),
          HomeAutomationStyles.mediumVGap,
        ],
      ),
    );
  }
}
