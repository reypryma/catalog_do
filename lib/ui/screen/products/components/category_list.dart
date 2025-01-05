import 'package:flutter/material.dart';
import 'package:horizontal_scroll_view/horizontal_scroll_view.dart';

import '../../../../layout/app_text.dart';
import '../../../../theme/app_theme.dart';

class CategoryListView extends StatelessWidget {
  final List<String> categories;

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

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Categories',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 70.0,
            child: HorizontalScrollView.builder(
              crossAxisSpacing: 8,
              itemCount: categories.length, itemWidth: 100, itemBuilder: (BuildContext context, int index) {
               return Padding(
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
                    );
              },
            )
          )
        ],
      ),
    );
  }
}
