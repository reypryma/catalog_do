
import 'package:catalog_do/constant/style.dart';
import 'package:catalog_do/data/user_data.dart';
import 'package:catalog_do/routes/app_routes.dart';

import 'model/nav_menu_item.dart';

String navMenuTitle = currentUser.title;
String navMenuSubtitle = currentUser.profession;

List<NavMenuItem> allMenuItem = [
  NavMenuItem(route: PageRoutes.dashboard, count: 1, title: "Dashboard", brief: "", icon: iconDashboard, type: "menu"),
  NavMenuItem(route: PageRoutes.searchProduct, count: 1, title: "Search", brief: "", icon: iconBlogs, type: "menu"),
  NavMenuItem(route: PageRoutes.setting, count: 1, title: "Setting", brief: "", icon: iconBlogCategories, type: "menu"),
];