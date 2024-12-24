import 'package:catalog_do/layout/app_layout.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../constant/style.dart';
import '../../../layout/responsive.dart';

class SearchProductsScreen extends StatefulWidget {
  const SearchProductsScreen({super.key});

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  final AppTheme _appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    String title = "Search product";

    return LayoutBuilder(builder: (context, constraints) {
      return AppScaffold(
        title: title,
        backbutton: "hide",
        invisibleAppBar: hideScaffoldAppBar,
        body: AppContentView(
          title: title,
          mobile: MobileView(
            widget: _buildContent(context),
          ),
          desktop: DesktopView(
            title: title,
            invisibleAppBar: hideScaffoldAppBar,
            widget: _buildContent(context),
          ),
        ),
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: sAllSidesGap,
        child: Column(
          children: [
            Container(
              constraints: Responsive().contentAreaWidth(),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                boxShadow:[BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0.5, 0.0),
                )],
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                    color: _appTheme.getTheme().colorScheme.primaryContainer,
                    width: 0.5),
                color: _appTheme.getTheme().colorScheme.surfaceContainer,
              ),
              child: Padding(
                  padding: Responsive().deviceType() == "desktop" ? sHorizontalGap : EdgeInsets.zero,
                  child: Column(
                    children: [
                      TextField(
                        controller: TextEditingController(),
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                        ),
                        decoration: searchCatalogDecoration(
                          prefixIcon: Icon(Icons.search, color: _appTheme.getTheme().colorScheme.onSurfaceVariant,),
                          showPreFixIcon: true,
                          hintText: "Search product name",
                        )
                      ),
                      SizedBox(height: 24,),

                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
