import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../styles/styles.dart';
import '../../../data/models/outlet.model.dart';
import '../../providers/add_device_providers.dart';
import 'device_type_selection_panel.dart';

class AddDeviceForm extends ConsumerWidget {
  final Function onSave;

  const AddDeviceForm({required this.onSave, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final outletList = ref.read(outletListVMProvider);
    final outletValue = ref.watch(outletValueProvider);
    final isFormValid = ref.watch(formValidatorProvider);
    final deviceNameCtrl = ref.read(deviceNameFieldProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
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
                  controller: deviceNameCtrl,
                  style: textTheme.displayMedium,
                  decoration: InputDecoration(
                    errorText: ref.watch(deviceExistsValidatorProvider)
                        ? 'Device name already exists'
                        : null,
                    errorStyle:
                        TextStyle(fontSize: 10, color: colorScheme.primary),
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
                    ref.read(deviceNameValueProvider.notifier).state = value;
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
              // outlets dropdown
              DropdownButtonHideUnderline(
                child: DropdownButton<OutletModel>(
                  borderRadius:
                      BorderRadius.circular(HomeAutomationStyles.smallRadius),
                  dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                  underline: null,
                  hint: Text(
                    'Select Outlet',
                    style: textTheme.labelMedium!.copyWith(color: Colors.grey),
                  ),
                  value: outletValue,
                  items: outletList.map<DropdownMenuItem<OutletModel>>(
                    (outlet) {
                      return DropdownMenuItem(
                        value: outlet,
                        child: Padding(
                          padding: const EdgeInsets.all(
                              HomeAutomationStyles.smallSize),
                          child: Text(
                            outlet.label,
                            style: textTheme.labelMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (OutletModel? value) {
                    ref
                        .read(outletListVMProvider.notifier)
                        .onSelectedOutlet(value!);
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: HomeAutomationStyles.largePadding,
          child: ElevatedButton(
            onPressed: isFormValid
                ? () {
                    onSave();
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
            child: const Text('Add Device'),
          ),
        ),
      ],
    );
  }
}
