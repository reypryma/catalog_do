import 'package:catalog_do/data/images.dart';
import 'package:catalog_do/layout/app_layout.dart';
import 'package:catalog_do/layout/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../constant/style.dart';

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
        backbutton: "hide",
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
            Navigator.of(context).pushNamed(pageFAB!);
          }
        },
        iconFAB: Icons.add,
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    // ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: sAllSidesGap,
        child: Column(
          children: [
            // Container(
            //   constraints: Responsive().contentAreaWidth(),
            //   child: Padding(
            //       padding: Responsive().deviceType() != "mobile"
            //           ? sHorizontalGap
            //           : EdgeInsets.zero,
            //       child: Placeholder()),
            // )
            _banner(context)
          ],
        ),
      ),
    );
  }

  Widget _banner(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(Images.dummy[2], fit: BoxFit.cover),
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withAlpha(120)),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: MyText.titleLarge("Shop the Latest Trends and Unbeatable Deals", fontWeight: 700, letterSpacing: 1, color: contentTheme.light, textAlign: TextAlign.center),
              ),
            ],
          )
        ],
      ),
    );
  }
}
