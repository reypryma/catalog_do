import 'dart:math';

import 'package:catalog_do/data/images.dart';
import 'package:catalog_do/layout/app_layout.dart';
import 'package:catalog_do/ui/screen/dashboard/components/product_dashboard.dart';
import 'package:flutter/material.dart';

import '../../../layout/app_text.dart';
import '../../../constant/variable_constant.dart';
import '../../../theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen(
      {super.key, this.data, this.listTitle, this.pageFAB, this.settings});

  final List? data;
  final String? listTitle;
  final String? pageFAB;
  final List<String>? settings;

  @override
  Widget build(BuildContext context) {
    String title = "Dashboard";

    bool fab = false;
    if (pageFAB != null && pageFAB != "") {
      fab = true;
    }

    String blogTitle = title;
    if (listTitle != null) {
      blogTitle = listTitle!;
    }

    return LayoutBuilder(builder: (context, constraints) {
      return AppScaffold(
        title: blogTitle,
        backButton: "hide",
        menu: "show",
        invisibleAppBar: hideScaffoldAppBar,
        body: AppContentView(
          title: title,
          mobile: MobileView(
            widget: _buildContent(context),
          ),
          desktop: DesktopView(
            title: title,
            widget: _buildContent(context),
            invisibleAppBar: hideScaffoldAppBar,
          ),
        ),
        showFAB: fab ? true : false,
        onPressFAB: () {
          if (fab == true) {
            // Navigator.of(context).pushNamed(pageFAB!);
          }
        },
        iconFAB: Icons.add,
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    // ThemeData theme = Theme.of(context);
    ThemeData theme = AppTheme().getTheme();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            _banner(context, theme),
            SizedBox(height: 12,),
            ProductDashboard(),
          ],
        ),
      ),
    );
  }

  Widget _banner(BuildContext context, ThemeData theme) {
    final random = Random();
    final dummyImages = Images.dummy;
    final randomIndex = random.nextInt(dummyImages.length);

    return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(Images.dummy[randomIndex], fit: BoxFit.cover),
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withAlpha(120)),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: AppText.titleLarge(
                    "Shop the Latest Trends and Unbeatable Deals",
                    fontWeight: 700,
                    letterSpacing: 1,
                    color: Colors.yellow,
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: theme.secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(100)),
                child: AppText.bodySmall(
                  'This is Catalog Description',
                  fontWeight: 600,
                  letterSpacing: 1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )
        ],
    );
  }
}
