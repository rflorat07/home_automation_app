import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';
import '../../data/models/home_tile_option.dart';

class HomePageTile extends StatelessWidget {
  final HomeTileOption tile;
  final Function onTap;

  const HomePageTile({
    super.key,
    required this.tile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: HomeAutomationStyles.smallSize),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(HomeAutomationStyles.smallSize),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.15),
        child: InkWell(
          onTap: () {
            onTap(tile);
          },
          child: Container(
            width: 150,
            padding: HomeAutomationStyles.mediumPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  tile.icon,
                  size: HomeAutomationStyles.mediumIconSize,
                  color: Theme.of(context).colorScheme.primary,
                ),
                HomeAutomationStyles.smallVGap,
                Text(
                  tile.label,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
