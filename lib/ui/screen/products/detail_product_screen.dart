import 'package:catalog_do/constant/constant.dart';
import 'package:catalog_do/constant/style.dart';
import 'package:catalog_do/data/model/product.dart';
import 'package:catalog_do/layout/app_layout.dart';
import 'package:catalog_do/layout/responsive.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatelessWidget {
  final ShProduct product;

  const DetailProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String title = "Detail Product";

    return LayoutBuilder(builder: (context, constraints) {
      return AppScaffold(
        title: title,
        backbutton: "show",
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
