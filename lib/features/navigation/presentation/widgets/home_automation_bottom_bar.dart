import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../styles/styles.dart';
import '../providers/navigation_providers.dart';

class HomeAutomationBottomBar extends ConsumerWidget {
  const HomeAutomationBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final barItems = ref.watch(bottomBarVMProvider);

    return Container(
      padding: HomeAutomationStyles.xsmallPadding,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: barItems.map((e) {
          return Container(
            margin:
                const EdgeInsets.only(bottom: HomeAutomationStyles.smallSize),
            child: IconButton(
              onPressed: () {
                ref.read(bottomBarVMProvider.notifier).selectedItem(e);
              },
              icon: Icon(
                e.iconOption,
                color: e.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).iconTheme.color,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
