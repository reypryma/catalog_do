import 'package:catalog_do/theme/theme.dart';
import 'package:catalog_do/services/util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  static final _instance = AppTheme._();
  final _localDb = LocalDB();
  late MaterialTheme _materialTheme;
  late bool _useDarkSkin;

  ThemeMode _themeMode = ThemeMode.system;

  AppTheme._() {
    _getThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  ThemeData get lightTheme => _materialTheme.light();

  ThemeData get darkTheme => _materialTheme.dark();

  bool isDarkMode(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor == Colors.grey[900];

  factory AppTheme() {
    return _instance;
  }

  initTheme(BuildContext context) async {
    TextTheme textTheme =
        createTextTheme(context, "Roboto Serif", "Nanum Gothic Coding");
    _materialTheme = MaterialTheme(textTheme);
    await _localDb.setTheme(_themeMode == ThemeMode.dark);
  }

  Future<void> _getThemeMode() async {
    final isDarkMode = await _localDb.isDarkMode() ?? false;

    if (isDarkMode == true) {
      _themeMode = ThemeMode.dark;
      _useDarkSkin = true;
      notifyListeners();
    } else if (isDarkMode == false) {
      _themeMode = ThemeMode.light;
      _useDarkSkin = false;
      notifyListeners();
    }
  }

  bool usedDarkSkin() {
    return _useDarkSkin;
  }

  Future toggleTheme(BuildContext context) async {
    switch (_themeMode) {
      case ThemeMode.light:
        _themeMode = ThemeMode.dark;
        _useDarkSkin = true;
        break;
      case ThemeMode.dark:
        _themeMode = ThemeMode.light;
        _useDarkSkin = false;
        break;
      case ThemeMode.system:
        debugPrint(
            'Scaffold color #${Theme.of(context).scaffoldBackgroundColor.value.toRadixString(16).substring(2, 8)}');
        debugPrint(
            '#${Colors.grey[900]?.value.toRadixString(16).substring(2, 8)}');

        if (isDarkMode(context)) {
          _themeMode = ThemeMode.light;
          _useDarkSkin = false;
        } else {
          _themeMode = ThemeMode.dark;
          _useDarkSkin = true;
        }
    }

    notifyListeners();
    await _localDb.setTheme(_themeMode == ThemeMode.dark);
  }

  ThemeData getTheme() {
    if (themeMode == ThemeMode.dark) {
      return darkTheme;
    } else {
      return lightTheme;
    }
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

  Future setDynamicLayout(String key, dynamic value) async {
    if (key == "theme") {
      _prefs!.setString("theme", value);
    } else if (key == "mode") {
      _prefs!.setString("mode", value);
    } else if (key == "menu") {
      _prefs!.setString("menu", value);
    }
  }

  T? loadDynamicLayout<T>(String key) {
    return _prefs!.get(key) as T;
  }

  Future<bool> clearLocale() async {
    return await _prefs!.clear();
  }
}
