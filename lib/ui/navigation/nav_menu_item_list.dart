import 'package:catalog_do/data/model/nav_menu_item.dart';
import 'package:flutter/material.dart';

import 'nav_menu_header.dart';
import 'nav_menu_item.dart';
import 'nav_menu_item_widget.dart';

class NavigationMenuListItem extends StatelessWidget {
  const NavigationMenuListItem({
    super.key,
    required this.item,
  });

  final NavMenuItem item;

  @override
  Widget build(BuildContext context) {
    print("Navigation menu list item ${item.type}");
    if (item.type == "header") {
      return NavigationMenuHeader();
    } else if (item.type == "menu" || item.type == "menu_switch" ||
        item.type == "dialog" || item.type == "menu_utils") {
      return NavigationMenuItem(item: item);
    } else if (item.type == "menu_widget") {
      return NavigationMenuItemWidget(item: item);
    } else if (item.type == "section" || item.type == "spacer") {
      return NavigationMenuItemSection(item: item);
    } else {
      return Container();
    }
  }
}