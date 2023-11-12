import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../styles/styles.dart';

class MainPageHeader extends StatelessWidget {
  final String title;
  final Widget icon;

  const MainPageHeader({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HomeAutomationStyles.largePadding,
      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          )
        ]
            .animate(interval: 100.ms)
            .slideX(
              begin: 0.5,
              end: 0,
              duration: 0.5.seconds,
              curve: Curves.easeInOut,
            )
            .fadeIn(
              duration: 0.5.seconds,
              curve: Curves.easeInOut,
            ),
      ),
    );
  }
}
