import 'dart:io';

import 'package:catalog_do/layout/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}


class DeviceHelper {
  static bool isWeb() {
    return kIsWeb;
  }
  static bool isAndroid(){
    return Platform.isAndroid;
  }
}

bool checkIfDeviceWide() => Responsive().deviceType() == "desktop" || Responsive().deviceType() == "tablet";

void finish(BuildContext context, [Object? result]) {
  if (Navigator.canPop(context)) Navigator.pop(context, result);
}

Color getColorFromHex(String hexColor, {Color? defaultColor}) {
  if (hexColor.isEmpty) {
    if (defaultColor != null) {
      return defaultColor;
    } else {
      throw ArgumentError('Can not parse provided hex $hexColor');
    }
  }

  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}