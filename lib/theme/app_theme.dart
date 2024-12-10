import 'package:catalog_do/theme/theme.dart';
import 'package:catalog_do/theme/util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';

class AppTheme extends ChangeNotifier {
  static final _instance = AppTheme._();
  final _localDb = LocalDB();
  late MaterialTheme _materialTheme;
  late int _bgSkin;

  String? _theme = defaultThemeName;
  String? _mode = defaultMode;
  String? _topbar = defaultTopBar;
  String? _menu = defaultMenu;


  ThemeMode _themeMode = ThemeMode.system;

  AppTheme._() {
    _bgSkin = 0;
    _mode = defaultMode;
    _topbar = defaultTopBar;
    _bgSkin = defaultBGSkin;
    _menu = defaultMenu;
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

  buildBGSkin(BuildContext context) {
    return createBGSkin(context, _bgSkin);
  }

  int createBGSkin(BuildContext context, int _bgSkin) {
    return _bgSkin;
  }

  changeBGSkin(int s) {
    _bgSkin = s;
    savePreferences("bgSkin", s);
    notifyListeners();
  }

  loadPreferences() async {

    _theme = _localDb.loadDynamicLayout<String>("theme") ?? defaultThemeName;
    _mode = _localDb.loadDynamicLayout<String>("mode") ?? defaultMode;
    _topbar = _localDb.loadDynamicLayout<String>("topbar") ?? defaultTopBar;
    _menu = _localDb.loadDynamicLayout<String>("menu") ?? defaultMenu;
    _bgSkin = _localDb.loadDynamicLayout<int>("bgSkin") ?? defaultBGSkin;

    notifyListeners();
  }

  savePreferences(String key, dynamic value) async {
    // _pref.clear();
    _localDb.setDynamicLayout(key, value);
  }

  changeBrightness(String b) {
    _mode = b;
    savePreferences("mode", b);

    if (linkTopBarWithMode == true) {
      _topbar = b;
      savePreferences("topbar", b);
    }

    if (linkMenuWithMode == true) {
      _menu = b;
      savePreferences("menu", b);
    }

    notifyListeners();
  }

  changeTopBar(String tb) {
    _topbar = tb;
    savePreferences("topbar", tb);
    notifyListeners();
  }

  changeMenu(String m) {
    _menu = m;
    savePreferences("menu", m);
    notifyListeners();
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

  Future setDynamicLayout(String key, dynamic value) async{
    if (key == "theme") {
      _prefs!.setString("theme", value);
    } else if (key == "mode") {
      _prefs!.setString("mode", value);
    } else if (key == "topbar") {
      _prefs!.setString("topbar", value);
    } else if (key == "menu") {
      _prefs!.setString("menu", value);
    } else if (key == "bgSkin") {
      _prefs!.setInt("bgSkin", value);
    }

    print("Set key $key : $value");
  }

  T? loadDynamicLayout<T>(String key){
    return _prefs!.get(key) as T;
  }

  Future<bool> clearLocale() async {
    return await _prefs!.clear();
  }
}