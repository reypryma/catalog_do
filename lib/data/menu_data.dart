
import 'package:catalog_do/constant/style_constant.dart';
import 'package:catalog_do/data/user_data.dart';
import 'package:catalog_do/routes/app_routes.dart';

import 'model/nav_menu_item.dart';

String navMenuTitle = currentUser.title;
String navMenuSubtitle = currentUser.profession;

List<NavMenuItem> allMenuItem = [
  NavMenuItem(route: "", count: 1, title: "Do Catalog", brief: "", type: "section"),
  NavMenuItem(route: PageRoutes.dashboard, count: 1, title: "Dashboard", brief: "", icon: iconDashboard, type: "menu"),
  NavMenuItem(route: PageRoutes.searchProduct, count: 1, title: "Search", brief: "", icon: iconCatalog, type: "menu"),
  NavMenuItem(route: PageRoutes.setting, count: 1, title: "Setting", brief: "", icon: iconSetting, type: "menu"),
];