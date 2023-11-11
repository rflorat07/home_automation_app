import 'package:flutter/material.dart';

import '../../../../helpers/enums.dart';
import '../../../../styles/flicky_icons_icons.dart';
import '../models/home_tile_option.dart';

class HomeTileOptionsRepository {
  List<HomeTileOption> getHomeTileOptions() {
    return [
      HomeTileOption(
        icon: Icons.add_circle_outline,
        label: 'Add New Device',
        option: HomeTileOptions.addDevice,
      ),
      HomeTileOption(
        icon: FlickyIcons.oven,
        label: 'Manage Devices',
        option: HomeTileOptions.manageDevices,
      ),
      HomeTileOption(
        icon: Icons.sensors,
        label: 'Test Connectivity',
        option: HomeTileOptions.manageDevices,
      ),
    ];
  }
}
