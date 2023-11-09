import '../../../../helpers/enums.dart';
import '../../../devices/presentation/pages/devices.page.dart';
import '../../../landing/presentation/pages/home.page.dart';
import '../../../rooms/presentation/pages/rooms.page.dart';
import '../../../settings/presentation/pages/settings.page.dart';
import '../models/bottom_bar_nav_item.dart';

class BottomNavBarRepository {
  List<BottomBarNavItemModel> getBottomBarNavItem() {
    return [
      BottomBarNavItemModel(
        iconOption: FlickyAnimatedIconOptions.barhome,
        route: HomePage.route,
        isSelected: true,
      ),
      BottomBarNavItemModel(
        iconOption: FlickyAnimatedIconOptions.barrooms,
        route: RoomsPage.route,
      ),
      BottomBarNavItemModel(
        iconOption: FlickyAnimatedIconOptions.bardevices,
        route: DevicesPage.route,
      ),
      BottomBarNavItemModel(
        iconOption: FlickyAnimatedIconOptions.barsettings,
        route: SettingsPage.route,
      ),
    ];
  }
}
