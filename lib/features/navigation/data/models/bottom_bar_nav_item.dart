import 'package:flutter/material.dart';

class BottomBarNavItemModel {
  final IconData iconOption;
  final String label;
  final String route;
  final bool isSelected;

  BottomBarNavItemModel({
    required this.iconOption,
    this.label = '',
    required this.route,
    this.isSelected = false,
  });

  BottomBarNavItemModel copyWith({
    IconData? iconOption,
    String? label,
    String? route,
    bool? isSelected,
  }) {
    return BottomBarNavItemModel(
        iconOption: iconOption ?? this.iconOption,
        route: route ?? this.route,
        label: label ?? this.label,
        isSelected: isSelected ?? this.isSelected);
  }
}
