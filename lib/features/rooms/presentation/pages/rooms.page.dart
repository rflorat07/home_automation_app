import 'package:flutter/material.dart';

import '../../../../helpers/enums.dart';
import '../../../shared/widgets/flicky_animated_icons.dart';
import '../../../shared/widgets/main_page_header.dart';

class RoomsPage extends StatelessWidget {
  static const String route = "/rooms";
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainPageHeader(
          title: 'My Rooms',
          icon: FlickyAnimatedIcons(
            icon: FlickyAnimatedIconOptions.barrooms,
            size: FlickyAnimatedIconSizes.large,
            isSelected: true,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
