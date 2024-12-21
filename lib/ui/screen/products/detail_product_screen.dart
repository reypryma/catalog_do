import 'package:catalog_do/constant/constant.dart';
import 'package:catalog_do/constant/style.dart';
import 'package:catalog_do/data/model/product.dart';
import 'package:catalog_do/layout/app_layout.dart';
import 'package:catalog_do/layout/responsive.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatefulWidget {
  final ShProduct product;

  const DetailProductScreen({super.key, required this.product});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {

  var position = 0;

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
            widget: _buildContentMobile(context),
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
                padding: sHorizontalGap,
                child: Placeholder()
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentMobile(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: sAllSidesGap,
        child: Column(
          children: [
            Container(
              constraints: Responsive().contentAreaWidth(),
              child: Padding(
                  padding: EdgeInsets.zero,
                  child: Placeholder()
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayProductImages(BuildContext context){
    return Container(
      height: 550,
      child: PageView.builder(
        itemCount: widget.product.images!.length,
        itemBuilder: (context, index) {
          return Image.asset("images/products${widget.product.images![index].src!}", width: double.infinity, height: 380, fit: BoxFit.cover);
        },
        onPageChanged: (index) {
          position = index;
          setState(() {});
        },
      ),
    );
  }


}
