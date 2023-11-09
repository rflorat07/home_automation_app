import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/bottom_bar_nav_item.dart';
import '../../data/repositories/bottom_nav_bar_repository.dart';
import '../../data/repositories/side_menu_repository.dart';
import '../viewmodels/bottom_bar.viewmodels.dart';

final bottomBarRepositoryProvider = Provider((ref) {
  return BottomNavBarRepository();
});

final bottomBarVMProvider =
    StateNotifierProvider<BottomBarViewModel, List<BottomBarNavItemModel>>(
        (ref) {
  final navItem = ref.read(bottomBarRepositoryProvider).getBottomBarNavItem();
  return BottomBarViewModel(navItem, ref);
});

final sideMenuRepositoryProvider = Provider((ref) {
  return SideMenuRepository();
});

final sideMenuProvider = Provider((ref) {
  return ref.read(sideMenuRepositoryProvider).getSideMenuItems();
});
