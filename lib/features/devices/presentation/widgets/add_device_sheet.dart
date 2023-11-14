import 'package:flutter/material.dart';

import '../../../../helpers/enums.dart';
import '../../../../styles/styles.dart';
import '../../../shared/widgets/warning_message.dart';
import 'add_device_workflow/add_device_form.dart';

class AddDeviceSheet extends StatelessWidget {
  const AddDeviceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Widget? returningWidget;
    AddDeviceStates formState = AddDeviceStates.none;

    switch (formState) {
      case AddDeviceStates.none:
        returningWidget = const AddDeviceForm();
        break;
      case AddDeviceStates.saving:
        // show saving state
        break;
      case AddDeviceStates.saved:
        // show saved state
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
        child: returningWidget!,
      ),
    );
  }
}
