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

Map<int, Map<String, dynamic>> bgSkins = {};
int defaultBGSkin = 0;

double appBackgroundRadius = 30.0;
double appBackgroundHeight = 200.0;
double appBackgroundElevation = 3;
double appBarElevation = 1;

// App Settings - Change Top Bar and Menu with App Mode
List<String> pageHeaderIcons = ["settings"];

const bool enableFormValidation = true;
