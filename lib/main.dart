import 'package:catalog_do/routes/app_routes.dart';
import 'package:catalog_do/theme/app_theme.dart';
import 'package:catalog_do/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'constant/variable_constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appTheme = AppTheme();

  @override
  void initState() {
    super.initState();
    _appTheme.initTheme(context);
    _appTheme.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    deviceOrientation = MediaQuery.of(context).orientation;
    deviceShortestSide = MediaQuery.of(context).size.shortestSide;

    return MaterialApp(
        theme: _appTheme.lightTheme,
        darkTheme: _appTheme.darkTheme,
        themeMode: _appTheme.themeMode,
        routes: PageRoutes.routes(context),
        home: SplashScreen());
  }
}
