import 'package:catalog_do/layout/app_text.dart';
import 'package:catalog_do/constant/style_constant.dart';
import 'package:catalog_do/data/model/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Card(
      elevation: sCardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: sCardBorderRadius,
        side: BorderSide(
          color: theme.colorScheme.inversePrimary,
          width: 1, // Set the border width
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: ProductItem(
          product: product,
          textMaxLines: 3,
          imageHeight: 210,
        ),
      ),
    );
    // });
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    this.boxDivider,
    this.showComments = false,
    this.showFullText = false,
    this.imageHeight,
    this.textMaxLines,
  });

  final Product product;
  final BoxDecoration? boxDivider;
  final bool? showComments;
  final bool? showFullText;
  final double? imageHeight;
  final int? textMaxLines;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (product.name ?? ""),
            style: theme.textTheme.headlineSmall,
            maxLines: textMaxLines,
            overflow: ((textMaxLines != null) ? TextOverflow.ellipsis : null),
            // style: sText,
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  constraints: BoxConstraints(maxHeight: 300),
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber, width: 1)),
                  child: Image.asset(product.images![0].src!,
                      fit: BoxFit.cover,
                      height: width * 0.35,
                      width: width * 0.29),
                ),
                SizedBox(height: 10),
                Text(
                  (product.description ?? ""),
                  style: theme.textTheme.bodyMedium,
                  maxLines: textMaxLines,
                  overflow:
                      ((textMaxLines != null) ? TextOverflow.ellipsis : null),
                  // style: sText,
                ),
                SizedBox(height: 10),
                AppText.bodyLarge(
                  "\$${product.regularPrice}.00",
                  fontWeight: 600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
