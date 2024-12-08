
import 'package:catalog_do/constant/style.dart';
import 'package:catalog_do/data/user_data.dart';

import 'model/nav_menu_item.dart';

String navMenuTitle = currentUser.title;
String navMenuSubtitle = currentUser.profession;

List<NavMenuItem> allMenuItem = [
  NavMenuItem(route: 'dashboard', count: 1, title: "Dashboard", brief: "", icon: iconDashboard, type: "menu"),
  NavMenuItem(route: 'blogs', count: 1, title: "Blogs", brief: "", icon: iconBlogs, type: "menu"),
  NavMenuItem(route: 'blog-categories', count: 1, title: "BlogCategories", brief: "", icon: iconBlogCategories, type: "menu"),
];