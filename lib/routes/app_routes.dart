import 'package:catalog_do/ui/screen/dashboard/dashboard_screen.dart';
import 'package:catalog_do/ui/screen/products/detail_product_screen.dart';
import 'package:catalog_do/ui/screen/products/search_products_screen.dart';
import 'package:catalog_do/ui/screen/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class PageRoutes{
  static const String dashboard = 'dashboard';
  static const String searchProduct = 'search_product_screen';
  static const String detailProduct = 'detail_product';
  static const String setting = 'setting';

  static Map<String, WidgetBuilder> routes(BuildContext context) {
    return {
      dashboard: (context) => DashboardScreen(),
      searchProduct: (context) => SearchProductsScreen(),
      detailProduct: (context) => DetailProductScreen(),
      setting: (context) => SettingScreen()
    };
  }
}