import 'package:flutter/material.dart';

class Utils {
  static GlobalKey<NavigatorState> mainNav = GlobalKey();
  static GlobalKey<NavigatorState> tabNav = GlobalKey();
  static GlobalKey<NavigatorState> scaffoldKey = GlobalKey();

  static void showUIModel(BuildContext context, Widget child,
      {bool dismissible = false, Function? onDismissed}) {
    showModalBottomSheet(
      isDismissible: dismissible,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctxt) {
        return child;
      },
    ).whenComplete(() {
      onDismissed!();
    });
  }
}
