import 'package:flutter/material.dart';

import '../../../../helpers/enums.dart';
import '../../../../styles/styles.dart';
import '../../../shared/widgets/flicky_animated_icons.dart';
import '../../../shared/widgets/main_page_header.dart';
import '../responsiveness/device_details_responsive.config.dart';
import '../widgets/device_details_panel.dart';
import '../widgets/devices_list.dart';

class DevicesPage extends StatelessWidget {
  static const String route = "/devices";
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final config = DeviceDetailsResponsiveConfig.deviceDetailsConfig(context);
    const header = MainPageHeader(
      title: 'My Devices',
      icon: FlickyAnimatedIcons(
        icon: FlickyAnimatedIconOptions.bardevices,
        size: FlickyAnimatedIconSizes.large,
        isSelected: true,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: config.showSingleLayout,
          replacement: Builder(
            builder: (context) {
              return const Expanded(
                  child: Padding(
                padding: HomeAutomationStyles.mediumPadding,
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header,
                        Expanded(child: DevicesList()),
                      ],
                    )),
                    Expanded(child: DeviceDetailsPanel()),
                  ],
                ),
              ));
            },
          ),
          child: const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header,
                DevicesList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
