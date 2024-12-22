import 'package:catalog_do/theme/theme.dart';
import 'package:catalog_do/services/util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';

class AppTheme extends ChangeNotifier {
  static final _instance = AppTheme._();
  final _localDb = LocalDB();
  late MaterialTheme _materialTheme;
  late int _bgSkin;
  late bool _useDarkSkin;

  String? _theme = defaultThemeName;
  String? _mode = defaultMode;
  String? _topbar = defaultTopBar;
  String? _menu = defaultMenu;


  ThemeMode _themeMode = ThemeMode.system;

  AppTheme._() {
    _bgSkin = 0;
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

  initTheme(BuildContext context) async {
    TextTheme textTheme = createTextTheme(context, "Roboto Serif", "Nanum Gothic Coding");
    _materialTheme = MaterialTheme(textTheme);
    print('${_themeMode == ThemeMode.dark}');
    await _localDb.setTheme(_themeMode == ThemeMode.dark);
  }

  ThemeData get lightTheme => _materialTheme.light();

  ThemeData get darkTheme => _materialTheme.dark();

  Future<void> _getThemeMode() async {
    final isDarkMode = await _localDb.isDarkMode() ?? false;

    if (isDarkMode == true) {
      print("_getThemeMode isDarkMode ${_localDb.loadDynamicLayout('isDarkMode')}");
      _themeMode = ThemeMode.dark;
      _useDarkSkin = true;
      notifyListeners();
    } else if (isDarkMode == false) {
      _themeMode = ThemeMode.light;
      _useDarkSkin = false;
      notifyListeners();
    }
  }

  bool usedDarkSkin(){
    // notifyListeners();
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
        print('Scaffold color #${Theme.of(context).scaffoldBackgroundColor.value.toRadixString(16).substring(2, 8)}');
        print('#${Colors.grey[900]?.value.toRadixString(16).substring(2, 8)}');

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


  ThemeData getTheme() {
    // print("getTheme isDarkMode ${_localDb.loadDynamicLayout('isDarkMode')}");
    if (themeMode ==  ThemeMode.dark) {
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