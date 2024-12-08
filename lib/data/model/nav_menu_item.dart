import 'package:flutter/material.dart';

class NavMenuItem {
  final String route;
  final String title;
  final String? brief;
  final IconData? icon;
  final int? count;
  final String type;
  final String? image;
  final Widget? dialogWidget;
  NavMenuItem({
    this.route = "",
    required this.title,
    this.brief,
    this.icon,
    this.count,
    required this.type,
    this.image,
    this.dialogWidget,
  });
}