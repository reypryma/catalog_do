import 'package:flutter/material.dart';

import '../constant/variable_constant.dart';

class Responsive {
  late String device;

  String deviceType() {

    if (deviceShortestSide! > 800) {
      device = "desktop";
    } else if (deviceShortestSide! > 650) {
      device = "tablet";
    } else if (deviceShortestSide! < 650) {
      device = "mobile";
    }

    return device;
  }

  BoxConstraints formAreaWidth() {
    return BoxConstraints(maxWidth: 600);
  }

  BoxConstraints contentAreaWidth() {
    late double mw;

    device = deviceType();

    if (deviceOrientation == Orientation.landscape) {
      if (device == "mobile") {
        mw = 900;
      } else if (device == "tablet") {
        mw = 1100;
      } else if (device == "desktop") {
        mw = 1200;
      }
    }

    if (deviceOrientation == Orientation.portrait) {
      if (device == "mobile") {
        mw = 550;
      } else if (device == "tablet") {
        mw = 700;
      } else if (device == "desktop") {
        mw = 800;
      }
    }

    // return maxWidth;
    return BoxConstraints(maxWidth: mw);
  }
}