import 'package:flutter/material.dart';

import '../../../../helpers/enums.dart';
import '../../../shared/widgets/flicky_animated_icons.dart';
import '../../../shared/widgets/main_page_header.dart';
import '../../../shared/widgets/warning_message.dart';

class SettingsPage extends StatelessWidget {
  static const String route = "/settings";
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainPageHeader(
          title: 'My Settins',
          icon: FlickyAnimatedIcons(
            icon: FlickyAnimatedIconOptions.barsettings,
            size: FlickyAnimatedIconSizes.large,
            isSelected: true,
          ),
        ),
        Expanded(
          child: WarningMessage(message: 'No available settings'),
        ),
      ],
    );
  }
}
