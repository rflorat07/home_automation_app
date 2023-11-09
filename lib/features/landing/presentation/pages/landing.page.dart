import 'package:flutter/material.dart';

import '../../../navigation/presentation/widgets/home_automation_appbar.dart';
import '../../../navigation/presentation/widgets/home_automation_bottom_bar.dart';
import '../../../navigation/presentation/widgets/side_menu_drawer.dart';

class LandingPage extends StatelessWidget {
  final Widget child;
  const LandingPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SideMenuDrawer(),
      ),
      appBar: const HomeAutomationAppBar(),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: SafeArea(child: child),
          ),
          // bottom bar here
          const HomeAutomationBottomBar()
        ],
      ),
    );
  }
}
