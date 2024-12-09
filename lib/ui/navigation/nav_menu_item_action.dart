import 'package:catalog_do/constant/style.dart';
import 'package:catalog_do/data/model/nav_menu_item.dart';
import 'package:flutter/material.dart';

class NavigationMenuItemAction extends StatelessWidget {
  const NavigationMenuItemAction({
    super.key,
    required this.item,
  });

  final NavMenuItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Icon(
        Icons.chevron_right,
        size: 15,
        color: sNavMenuArrow(context),
      ),
    );
  }
}