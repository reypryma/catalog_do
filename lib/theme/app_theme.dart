import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  static final _instance = AppTheme._();
  final _localDb = LocalDB();

  ThemeMode _themeMode = ThemeMode.system;

  AppTheme._() {
    _getThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  bool isDarkMode(BuildContext context) => Theme.of(context).scaffoldBackgroundColor == Colors.grey[900];

  factory AppTheme() {
    return _instance;
  }

  ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.grey),
      titleLarge: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  ThemeData get darkTheme => ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.grey[200]),
      titleLarge: const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

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