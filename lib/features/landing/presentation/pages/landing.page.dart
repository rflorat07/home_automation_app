import 'package:flutter/material.dart';

import '../../../navigation/presentation/widgets/home_automation_bottom_bar.dart';

class LandingPage extends StatelessWidget {
  final Widget child;
  const LandingPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
