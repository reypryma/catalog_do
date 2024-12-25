import 'package:catalog_do/data/model/nav_menu_item.dart';
import 'package:catalog_do/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../constant/style_constant.dart';
import 'nav_menu_item_action.dart';

class NavigationMenuItem extends StatelessWidget {
  const NavigationMenuItem({
    super.key,
    required this.item,
  });

  final NavMenuItem item;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme();

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
      child: ListTile(
        hoverColor: sNavMenuItemHoverColor(context),
        minLeadingWidth: -40.0,
        visualDensity: VisualDensity(horizontal: 0, vertical: -3.5),
        // dense: true,
        contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 15.0, 0.0),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
          child: Container(
            padding: EdgeInsets.all(5.0),
            decoration: sNavMenuItemIconDecoration(context),
            child: (Icon(
              item.icon,
              size: sNavMenuItemIconSize,
              color: appTheme.getTheme().colorScheme.onSecondaryContainer,
            )),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            item.title,
            style: sNavMenuItem(context),
          ),
        ),
        onTap: () {
          if (item.type == "menu") {
            Navigator.pop(context);
            Navigator.of(context).pushNamed(item.route);
          }
          if (item.type == "dialog") {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return item.dialogWidget ?? Container();
                });
          }
        },
        trailing: NavigationMenuItemAction(
          item: item,
        ),
      ),
    );
  }
}

class NavigationMenuItemSection extends StatelessWidget {
  const NavigationMenuItemSection({
    super.key,
    required this.item,
  });

  final NavMenuItem item;

  @override
  Widget build(BuildContext context) {
    if (item.type == "spacer") {
      return Padding(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        child: SizedBox(),
      );
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: Text(
          item.title,
          style: sNavMenuSectionName(context),
        ),
      );
    }
  }
}
