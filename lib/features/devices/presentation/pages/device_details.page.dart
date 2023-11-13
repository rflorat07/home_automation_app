import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';
import '../../../navigation/presentation/widgets/home_automation_appbar.dart';
import '../widgets/device_details_panel.dart';

class DeviceDetailsPage extends StatelessWidget {
  static const String roure = '/device_details';
  const DeviceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAutomationAppBar(),
      body: Padding(
        padding: HomeAutomationStyles.largePadding,
        child: SafeArea(
          child: DeviceDetailsPanel(),
        ),
      ),
    );
  }
}
