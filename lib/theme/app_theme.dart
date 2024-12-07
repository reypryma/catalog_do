import 'package:catalog_do/theme/theme.dart';
import 'package:catalog_do/theme/util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  static final _instance = AppTheme._();
  final _localDb = LocalDB();
  late MaterialTheme _materialTheme;

  ThemeMode _themeMode = ThemeMode.system;

  AppTheme._() {
    _getThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  bool isDarkMode(BuildContext context) => Theme.of(context).scaffoldBackgroundColor == Colors.grey[900];

  factory AppTheme() {
    return _instance;
  }

  initTheme(BuildContext context){
    TextTheme textTheme = createTextTheme(context, "Roboto Serif", "Nanum Gothic Coding");
    _materialTheme = MaterialTheme(textTheme);
  }

  ThemeData get lightTheme => _materialTheme.light();

  ThemeData get darkTheme => _materialTheme.dark();

  Future<void> _getThemeMode() async {
    final isDarkMode = await _localDb.isDarkMode();

    if (isDarkMode == true) {
      _themeMode = ThemeMode.dark;
      notifyListeners();
    } else if (isDarkMode == false) {
      _themeMode = ThemeMode.light;
      notifyListeners();
    }
  }

  Future toggleTheme(BuildContext context) async {
    switch (_themeMode) {
      case ThemeMode.light:
        _themeMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        _themeMode = ThemeMode.light;
        break;
      case ThemeMode.system:
        if (isDarkMode(context)) {
          _themeMode = ThemeMode.light;
        } else {
          _themeMode = ThemeMode.dark;
        }
    }

    notifyListeners();
    await _localDb.setTheme(_themeMode == ThemeMode.dark);
  }
}

class LocalDB {
  SharedPreferences? _prefs;

  Future _init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future isDarkMode() async {
    await _init();
    return _prefs?.getBool('isDarkMode');
  }

  Future setTheme(bool isDarkMode) async {
    await _init();
    await _prefs?.setBool('isDarkMode', isDarkMode);
  }
}