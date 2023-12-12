import 'package:flutter/material.dart';

import '../../../navigation/presentation/widgets/home_automation_appbar.dart';
import '../../../navigation/presentation/widgets/home_automation_bottom_bar.dart';
import '../../../navigation/presentation/widgets/side_menu_drawer.dart';
import '../responsiveness/landing_page_responsive.config.dart';

class LandingPage extends StatelessWidget {
  final Widget child;
  const LandingPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final config = LandingPageResponsiveConfig.landingPageConfig(context);

    return Scaffold(
      drawer: const Drawer(
        child: SideMenuDrawer(),
      ),
      appBar: const HomeAutomationAppBar(),
      body: Center(
        child: Flex(
          verticalDirection: config.contentVerticalDirection,
          direction: config.contentDirection,
          children: [
            Expanded(
              child: SafeArea(child: child),
            ),
            // bottom bar here
            const HomeAutomationBottomBar()
          ].reverse(config.reverseContent),
        ),
      ),
    );
  }
}

extension ReversedList on List<Widget> {
  List<Widget> reverse(bool reverse) {
    return reverse ? reversed.toList() : this;
  }
}
