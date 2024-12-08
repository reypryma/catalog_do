
import 'package:flutter/material.dart';

import 'layout_extension.dart';

extension ContextExtensions on BuildContext {
  /// return screen size
  Size size() =>
      MediaQuery
          .of(this)
          .size;

  /// return screen width
  double width() =>
      maxScreenWidth ?? MediaQuery
          .of(this)
          .size
          .width;
}