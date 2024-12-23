import 'package:carousel_slider/carousel_slider.dart';
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
  void initState() {
    super.initState();
    debugPrint(widget.product.average_rating);
    debugPrint("images count ${widget.product.images?.length}");
  }

  @override
  Widget build(BuildContext context) {
    String title = "Detail Product";
    ShProduct product = widget.product;

    var colorList = [];
    for (var element in product.attributes!) {
      if (element.name == 'Color') colorList.addAll(element.options!);
    }

    return LayoutBuilder(builder: (context, constraints) {
      return AppScaffold(
        title: title,
        backbutton: "show",
        invisibleAppBar: hideScaffoldAppBar,
        body: AppContentView(
          title: title,
          mobile: MobileView(
            widget: _buildContentMobile(context, product, colorList),
          ),
          desktop: DesktopView(
            title: title,
            invisibleAppBar: hideScaffoldAppBar,
            widget: _buildContent(context, product, colorList),
          ),
        ),
      );
    });
  }

  Widget _buildContent(
      BuildContext context, ShProduct product, List colorList) {
    return SingleChildScrollView(
      child: Padding(
        padding: sAllSidesGap,
        child: Column(
          children: [
            Container(
              constraints: Responsive().contentAreaWidth(),
              child: Padding(
                  padding: sHorizontalGap,
                  child: Row(
                    children: [
                      Expanded(child: _displayProductImages(context, product, colorList)),
                      Flexible(
                          flex: 2,
                          child: _displayProductDescription(product, colorList))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentMobile(
      BuildContext context, ShProduct product, List colorList) {
    return SingleChildScrollView(
      child: Padding(
        padding: sAllSidesGap,
        child: Column(
          children: [
            Container(
              constraints: Responsive().contentAreaWidth(),
              child: Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      _displayProductImages(context, widget.product, colorList),
                      SizedBox(
                        height: 24,
                      ),
                      _displayProductDescription(product, colorList)
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayProductImages(
      BuildContext context, ShProduct product, List colorList) {
    // return Container(
    //   decoration:
    //       BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
    //   clipBehavior: Clip.antiAliasWithSaveLayer,
    //   padding: EdgeInsets.zero,
    //   // width: 400,
    //   height: 550,
    //   child: PageView.builder(
    //     itemCount: product.images!.length,
    //     itemBuilder: (context, index) {
    //       return Image.asset("images/products${product.images![index].src!}",
    //           height: 300, width: 300, fit: BoxFit.cover);
    //     },
    //     onPageChanged: (index) {
    //       position = index;
    //       setState(() {});
    //     },
    //   ),
    // );
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: product.images!.map((image) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset("images/products${image.src!}",
                      height: 300, width: 300, fit: BoxFit.cover),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        '${image.name}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        );
      }).toList(),
    );
  }

  Widget _displayProductDescription(ShProduct product, List colorList) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: _appTheme.getTheme().colorScheme.surface,
          border: Border.all(
              color: _appTheme.getTheme().colorScheme.primaryContainer,
              width: 0.5),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: EdgeInsets.all(20),
        child: _productDescriptionView(product, colorList));
  }

  /*
  *
  * Build Component
  *
  * */

  Widget _colorsView(List colorList) => SizedBox(
        width: 500,
        height: 20,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colorList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(7),
              margin: EdgeInsets.only(right: 8),
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: sh_textColorPrimary, width: 0.5),
                  color: getColorFromHex(colorList[index])),
            );
          },
        ),
      );

  Widget _categoryListView(ShProduct product) => product.categories!.isNotEmpty
      ? SizedBox(
          width: deviceWidth,
          height: 40,
          child: ListView.builder(
            clipBehavior: Clip.hardEdge,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: product.categories!.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Chip(
                  label: AppText(product.categories![index].name ?? ""),
                  side: BorderSide(
                      style: BorderStyle.solid,
                      color: _appTheme.getTheme().highlightColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor:
                      _appTheme.getTheme().colorScheme.primary.withOpacity(0.3),
                ),
              );
            },
          ),
        )
      : SizedBox();

  Widget _productDescriptionView(ShProduct product, List colorList) => Column(
        children: [
          ProductRating(
            rating: double.parse(product.average_rating ?? "0"),
            inactiveColor: _appTheme.getTheme().colorScheme.secondary,
            activeColor: _appTheme.getTheme().colorScheme.primary,
          ),
          SizedBox(height: 8),
          AppText.titleMedium(
            "${product.name}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            fontWeight: 600,
          ),
          AppText.titleLarge(
            "Price \$ ${product.price ?? 0}",
            fontWeight: 600,
          ),
          SizedBox(
            height: 12,
          ),
          AppText.titleSmall(
            'Description',
            fontWeight: 600,
          ),
          SizedBox(height: 8),
          AppText.bodyLarge(
            "${product.description}",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText.labelMedium('Available Color: '),
              Expanded(child: _colorsView(colorList))
            ],
          ),
          SizedBox(height: 8),
          _categoryListView(product)
        ],
      );
}
