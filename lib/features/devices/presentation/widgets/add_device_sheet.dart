import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helpers/enums.dart';
import '../../../../styles/styles.dart';
import '../../../shared/widgets/warning_message.dart';
import '../providers/add_device_providers.dart';
import 'add_device_workflow/add_device_form.dart';
import 'add_device_workflow/saved_device_view.dart';
import 'add_device_workflow/saving_device_view.dart';

class AddDeviceSheet extends ConsumerWidget {
  const AddDeviceSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget? returningWidget;
    AddDeviceStates formState = ref.watch(saveAddDeviceVMProvider);

    switch (formState) {
      case AddDeviceStates.none:
        returningWidget = AddDeviceForm(
          onSave: () async {
            await ref.read(saveAddDeviceVMProvider.notifier).saveDevice();
          },
        );
        break;
      case AddDeviceStates.saving:
        // show saving state
        returningWidget = const SavingDeviceView();
        break;
      case AddDeviceStates.saved:
        // show saved state
        returningWidget = const SavedDeviceView();
        break;
      case AddDeviceStates.error:
        returningWidget = const WarningMessage(message: 'Error Adding Device');
        break;
      default:
        returningWidget = const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(HomeAutomationStyles.mediumRadius),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: SafeArea(
        child: returningWidget,
      ),
    );
  }
}
