import 'package:catalog_do/layout/app_layout.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../constant/style.dart';
import '../../../layout/responsive.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    String title = "App Setting";

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
              child: Padding(
                  padding: Responsive().deviceType() == "desktop" ? sHorizontalGap : EdgeInsets.zero,
                  child: Placeholder()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
