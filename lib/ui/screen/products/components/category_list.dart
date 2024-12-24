import 'package:flutter/material.dart';

import '../../../../constant/app_text.dart';
import '../../../../theme/app_theme.dart';

class CategoryListView extends StatelessWidget {
  final List<String> categories; // Pass the categories data

  const CategoryListView({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme();

    if (categories.isEmpty) {
      return SizedBox();
    }

    // return SizedBox(
    //   height: 40,
    //   child: SingleChildScrollView(
    //     scrollDirection: Axis.horizontal,
    //     child: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: categories.map((category) {
    //         return Padding(
    //           padding: const EdgeInsets.only(right: 4.0),
    //           child: Chip(
    //             label: Text(
    //               category ?? "",
    //               style: TextStyle(
    //                 color: appTheme.getTheme().colorScheme.onPrimary,
    //               ),
    //             ),
    //             side: BorderSide(
    //               style: BorderStyle.solid,
    //               color: appTheme.getTheme().highlightColor,
    //             ),
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //             backgroundColor: appTheme
    //                 .getTheme()
    //                 .colorScheme
    //                 .primary
    //                 .withOpacity(0.3),
    //           ),
    //         );
    //       }).toList(),
    //     ),
    //   ),
    // );

    // return SizedBox(
    //   height: 60,
    //   child: SingleChildScrollView(
    //     scrollDirection: Axis.horizontal,
    //     child: Row(
    //       children: [
    //         ListView.builder(
    //           itemCount: categories.length,
    //           itemBuilder: (context, index) {
    //             if (index == 0) {
    //               return SizedBox(width: 16);
    //             }
    //             return Padding(
    //               padding: const EdgeInsets.only(right: 4.0),
    //               child: Chip(
    //                 label: AppText(categories[index]),
    //                 side: BorderSide(
    //                     style: BorderStyle.solid,
    //                     color: appTheme.getTheme().highlightColor),
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(20)),
    //                 backgroundColor:
    //                 appTheme.getTheme().colorScheme.primary.withOpacity(0.3),
    //               ),
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Categories',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 60.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Chip(
                  label: AppText(categories[index]),
                  side: BorderSide(
                      style: BorderStyle.solid,
                      color: appTheme.getTheme().highlightColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor:
                      appTheme.getTheme().colorScheme.primary.withOpacity(0.3),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}