import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';
import '../widgets/home_page_header.dart';
import '../widgets/home_tile_options_panel.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Flex(
            direction: Axis.vertical,
            children: [
              HomePageHeader(),
              HomeAutomationStyles.mediumVGap,
              HomeTileOptionsPanel()
            ],
          ),
        )
      ],
    );
  }
}
