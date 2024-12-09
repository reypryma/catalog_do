import 'package:catalog_do/constant/constant.dart';
import 'package:catalog_do/data/menu_data.dart';
import 'package:catalog_do/data/model/nav_menu_item.dart';
import 'package:catalog_do/layout/responsive.dart';
import 'package:flutter/material.dart';

import 'nav_menu_item_list.dart';

class NavigationMenu extends StatefulWidget {
  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final ScrollController _menuController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double w = menuWidth;
    if (Responsive().deviceType() == "desktop") {
      w = menuWidthDesktop;
    } else if (Responsive().deviceType() == "tablet") {
      w = menuWidthTablet;
    }

    return Container(
      // constraints: BoxConstraints(maxWidth: 300),
      width: w, //double.infinity,
      child: Drawer(
        child: _buildMenu(),
      ),
    );
  }

  Widget _buildMenu() {

    return LayoutBuilder(builder: (context, constraints) {

      return ListView.builder(
          controller: _menuController,
          // shrinkWrap: true,
          // physics: ClampingScrollPhysics(),
          itemCount: allMenuItem.length,
          itemBuilder: (BuildContext content, int index) {
            NavMenuItem item = allMenuItem[index];
            return NavigationMenuListItem(item: item);
            //return UserListTile(user);
          });
    });
  }
}
