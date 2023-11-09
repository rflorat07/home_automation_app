import 'package:flutter/material.dart';

import '../../../../helpers/enums.dart';
import '../../../../styles/styles.dart';
import '../../../shared/widgets/flicky_animated_icons.dart';

class HomeAutomationAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const HomeAutomationAppBar({super.key});

  @override
  State<HomeAutomationAppBar> createState() => _HomeAutomationAppBarState();

  @override
  Size get preferredSize =>
      const Size.fromHeight(HomeAutomationStyles.appBarSize);
}

class _HomeAutomationAppBarState extends State<HomeAutomationAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const FlickyAnimatedIcons(
        icon: FlickyAnimatedIconOptions.flickybulb,
        isSelected: true,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
          ),
        ),
        HomeAutomationStyles.xxsmallHGap
      ],
    );
  }
}
