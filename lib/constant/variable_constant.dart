import 'package:flutter/material.dart';

double? deviceWidth;
double? deviceHeight;
double? deviceShortestSide;
Orientation? deviceOrientation;

double menuWidth = 300; // deviceWidth * 0.6;
double menuWidthDesktop = 300;
double menuWidthTablet = 300;
bool hideScaffoldAppBar = false;

String appVersion = '1.0.0';
String appContactEmail = 'email@example.com';

// String defaultThemeName = 'Orange';
// String defaultMode = 'light';
// String defaultTopBar = 'primary';
// String defaultMenu = 'light';

Map<int, Map<String, dynamic>> bgSkins = {};
int defaultBGSkin = 0;


// Widgets-AppBackground2
// String appBackground = "box"; //  "", box, inverted_box. Default "".
double appBackgroundRadius = 30.0;
double appBackgroundHeight = 200.0;
double appBackgroundElevation = 3;
double appBarElevation = 1; // Default 4.

// App Settings - Change Top Bar and Menu with App Mode
bool linkTopBarWithMode = false;
bool linkMenuWithMode = true;

List<String> pageHeaderIcons = ["settings"];

const bool enableFormValidation = true;

const String apiURL = "";
const String apiLocalDomain = "";
const String apiLocalIP = "";