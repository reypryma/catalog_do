import 'package:catalog_do/data/images.dart';
import 'package:catalog_do/data/menu_data.dart';
import 'package:flutter/material.dart';

import '../../constant/style_constant.dart';

class NavigationMenuHeader extends StatelessWidget {
  const NavigationMenuHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 180.0,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          image: DecorationImage(
            image: AssetImage(Images.currentUser),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 15.0, 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.pop(context);
                        Navigator.of(context).pushNamed('profile');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (navMenuTitle),
                            style: sNavMenuTitle(context),
                          ),
                          Text(
                            // Lang.navMenuSubtitle,
                            (navMenuSubtitle),
                            style: sNavMenuSubTitle(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.pop(context);
                        // Navigator.of(context).pushNamed('profile');
                      },
                      child: Text(
                        ("EditProfile"),
                        style: sNavMenuEdit(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
