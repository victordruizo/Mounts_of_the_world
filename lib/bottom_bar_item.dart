import 'package:flutter/cupertino.dart';

class AppBottomBarItem {
  IconData? icon;
  bool isSelected;
  String label;
  AppBottomBarItem({
    this.icon,
    this.label = '',
    this.isSelected = false
  });
}