import 'package:flutter/material.dart';

import '../../../../styles/flicky_icons_icons.dart';
import '../../../devices/presentation/pages/devices.page.dart';
import '../../../landing/presentation/pages/home.page.dart';
import '../../../rooms/presentation/pages/rooms.page.dart';
import '../../../settings/presentation/pages/settings.page.dart';
import '../models/bottom_bar_nav_item.dart';

class BottomNavBarRepository {
  List<BottomBarNavItemModel> getBottomBarNavItem() {
    return [
      BottomBarNavItemModel(
        iconOption: Icons.home,
        route: HomePage.route,
        isSelected: true,
      ),
      BottomBarNavItemModel(
        iconOption: FlickyIcons.room,
        route: RoomsPage.route,
      ),
      BottomBarNavItemModel(
        iconOption: FlickyIcons.heater,
        route: DevicesPage.route,
      ),
      BottomBarNavItemModel(
        iconOption: Icons.build,
        route: SettingsPage.route,
      ),
    ];
  }
}
