import 'package:flutter/material.dart';

import '../../../../helpers/enums.dart';
import '../../../shared/widgets/flicky_animated_icons.dart';
import '../../../shared/widgets/main_page_header.dart';
import '../widgets/devices_list.dart';

class DevicesPage extends StatelessWidget {
  static const String route = "/devices";
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainPageHeader(
          title: 'My Devices',
          icon: FlickyAnimatedIcons(
            icon: FlickyAnimatedIconOptions.bardevices,
            size: FlickyAnimatedIconSizes.large,
            isSelected: true,
          ),
        ),
        Expanded(
          child: DevicesList(),
        ),
      ],
    );
  }
}
