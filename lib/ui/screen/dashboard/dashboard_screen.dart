import 'package:catalog_do/layout/app_layout.dart';
import 'package:catalog_do/layout/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../constant/style.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, this.data, this.listTitle, this.pageFAB, this.settings});

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
      // deviceWidth = MediaQuery.of(context).size.width;
      // deviceHeight = MediaQuery.of(context).size.height;
      // deviceOrientation = MediaQuery.of(context).orientation;
      // deviceShortestSide = MediaQuery.of(context).size.shortestSide;
      //
      // print("deviceShortestSide $deviceShortestSide");
      // print("deviceWidth $deviceWidth");
      // print("deviceHeight $deviceHeight");
      // print("deviceOrientation $deviceOrientation");

      return AppScaffold(
        title: blogTitle,
        backbutton: "hide",
        menu: "show",
        invisibleAppBar: hideScaffoldAppBar,
        body: AppContentView(
          title: title,
          mobile: MobileView(
            widget: Placeholder(),
          ),
          desktop: DesktopView(
            title: title,
            widget: Container(),
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

  Widget _buildContent(BuildContext context, List blogData, List<String> settings) {
    // ThemeData theme = Theme.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: sAllSidesGap,
        child: Column(
          children: [
            Container(
              constraints: Responsive().contentAreaWidth(),
              child: Padding(
                padding: Responsive().deviceType() != "mobile" ? sHorizontalGap : EdgeInsets.zero,
                child: Placeholder()
            ),
            )
          ],
        ),
      ),
    );
  }
}
