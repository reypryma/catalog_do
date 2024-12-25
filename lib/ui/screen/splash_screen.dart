import 'dart:async';

import 'package:catalog_do/layout/app_layout.dart';
import 'package:catalog_do/routes/app_routes.dart';
import 'package:catalog_do/services/util.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
          () {
        finish(context);
        Navigator.of(context).pushNamed(PageRoutes.auth);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: false,
      body: Center(child: Icon(Icons.shopping_bag_sharp, size: 120)),
    );
  }
}
