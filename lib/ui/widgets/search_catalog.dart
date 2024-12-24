import 'package:catalog_do/ext/boolean_extension.dart';
import 'package:catalog_do/ext/widget_extension.dart';
import 'package:catalog_do/theme/app_theme.dart';
import 'package:flutter/material.dart';

// InputDecoration searchCatalogDecoration(
//     {Icon? icon, String? hintText, Icon? prefixIcon, bool showPreFixIcon = false}) {
//   AppTheme appTheme = AppTheme();
//
//   return InputDecoration(
//       contentPadding: EdgeInsets.all(16),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8.0),
//         borderSide: BorderSide(color: Colors.grey.withOpacity(0.6), width: 2),
//       ),
//       hintText: hintText,
//       hintStyle: TextStyle(
//         fontWeight: FontWeight.w500,
//         fontSize: 16,
//         color: appTheme.getTheme().colorScheme.onSurfaceVariant,
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8.0),
//         borderSide: BorderSide(
//             color: appTheme.getTheme().colorScheme.tertiaryContainer),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8.0),
//         borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
//       ),
//       filled: true,
//       fillColor: appTheme.getTheme().colorScheme.onSecondary,
//       suffixIcon: icon.validate(),
//       prefixIcon: showPreFixIcon ? prefixIcon?.validate() : null);
// }

InputDecoration searchCatalogDecoration({
  Widget? suffixIcon,
  String? hintText,
  Icon? prefixIcon,
  bool showPreFixIcon = false,
}) {
  AppTheme appTheme = AppTheme();

  return InputDecoration(
    contentPadding: EdgeInsets.all(16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.6), width: 2),
    ),
    hintText: hintText,
    hintStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: appTheme.getTheme().colorScheme.onSurfaceVariant,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: appTheme.getTheme().colorScheme.tertiaryContainer,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
    ),
    filled: true,
    fillColor: appTheme.getTheme().colorScheme.onSecondary,
    suffixIcon: suffixIcon, // Updated to Widget type
    prefixIcon: showPreFixIcon ? prefixIcon : null,
  );
}
