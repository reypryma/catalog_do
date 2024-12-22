import 'package:catalog_do/constant/app_text.dart';
import 'package:catalog_do/constant/constant.dart';
import 'package:catalog_do/constant/style.dart';
import 'package:catalog_do/data/model/product.dart';
import 'package:catalog_do/layout/app_layout.dart';
import 'package:catalog_do/layout/responsive.dart';
import 'package:catalog_do/services/util.dart';
import 'package:catalog_do/theme/app_theme.dart';
import 'package:catalog_do/ui/screen/products/components/product_rating.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatefulWidget {
  final ShProduct product;

  const DetailProductScreen({super.key, required this.product});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  var position = 0;
  AppTheme _appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    String title = "Detail Product";
    ShProduct product = product;

    var colorList = [];
    for (var element in product.attributes!) {
        if (element.name == 'Color') colorList.addAll(element.options!);
    }

    var colorsView = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: colorList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {

          },
          child: Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: sh_textColorPrimary, width: 0.5), color: getColorFromHex(colorList[index])),
          ),
        );
      },
    );

    var ratingsView = ProductRating(
      rating: product.rating_count?.toDouble() ?? 0,
      inactiveColor: _appTheme.getTheme().colorScheme.secondary,
      activeColor: _appTheme.getTheme().colorScheme.primary,
    );
    
    var categoryListView = product.categories!.isNotEmpty ? ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: product.categories!.length,
      itemBuilder: (_, index){
        return Chip(label: AppText(product.categories![index].name ?? ""),
          side: BorderSide(style: BorderStyle.solid, color: _appTheme.getTheme().highlightColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
      },
    ) : SizedBox();

    var productDescriptionView = Column(
      children: [

      ],
    );


    return LayoutBuilder(builder: (context, constraints) {
      return AppScaffold(
        title: title,
        backbutton: "show",
        invisibleAppBar: hideScaffoldAppBar,
        body: AppContentView(
          title: title,
          mobile: MobileView(
            widget: _buildContentMobile(context),
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
              child: Padding(padding: sHorizontalGap, child: Placeholder()),
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
              child: Padding(padding: EdgeInsets.zero, child: Placeholder()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayProductImages(BuildContext context, ShProduct product) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: EdgeInsets.zero,
      height: 550,
      child: PageView.builder(
        itemCount: product.images!.length,
        itemBuilder: (context, index) {
          return Image.asset(
              "images/products${product.images![index].src!}",
              width: double.infinity,
              height: 500,
              fit: BoxFit.cover);
        },
        onPageChanged: (index) {
          position = index;
          setState(() {});
        },
      ),
    );
  }

  Widget _displayProductDescription(List<Widget> extraDescriptionWidget, ShProduct product) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.titleMedium(
            "${product.name}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            fontWeight: 600,
          ),
          SizedBox(
            height: 12,
          ),
          AppText.bodySmall(""),
          ...extraDescriptionWidget
        ],
      ),
    );
  }

}
