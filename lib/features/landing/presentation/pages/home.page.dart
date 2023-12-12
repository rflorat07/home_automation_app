import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';
import '../responsiveness/landing_page_responsive.config.dart';
import '../widgets/energy_consumption_panel.dart';
import '../widgets/home_page_header.dart';
import '../widgets/home_tile_options_panel.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final config = LandingPageResponsiveConfig.landingPageConfig(context);

    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: config.homeTopPartFlex,
          child: Flex(
            direction: config.homeTopDirection,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: config.homeHeaderFlex,
                child: const HomePageHeader(),
              ),
              HomeAutomationStyles.smallVGap,
              const Expanded(
                child: HomeTileOptionsPanel(),
              )
            ],
          ),
        ),
        const Expanded(
          child: EnergyConsumptionPanel(),
        ),
      ],
    );
  }
}
