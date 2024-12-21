import 'package:catalog_do/constant/style.dart';
import 'package:catalog_do/data/model/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.blog,
    // this.showUsers = false,
  });

  final ShProduct blog;
  // final bool showUsers;

  @override
  Widget build(BuildContext context) {
    // ThemeData theme = Theme.of(context);
    // List<Widget> usersList = [];

    return Container(
      child: Card(
        elevation: sCardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: sCardBorderRadius,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: ProductItem(blog: blog, textMaxLines: 3, imageHeight: 210,),
        ),
      ),
    );
    // });
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.blog,
    this.boxDivider,
    this.showComments = false,
    this.showFullText = false,
    this.imageHeight,
    this.textMaxLines,
  });

  final ShProduct blog;
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
      padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5), // sBlogItemInnerPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (blog.name ?? ""),
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
                ClipRRect(
                  borderRadius: sImageBorderRadius,
                  child: Image(
                    height: imageHeight,
                    fit: BoxFit.fill,
                    image: AssetImage("images/products${blog.images![0].src!}" ?? ""),
                  )),
                SizedBox(height: 10),
                Text(
                  (blog.description ?? ""),
                  style: theme.textTheme.bodyMedium,
                  maxLines: textMaxLines,
                  overflow: ((textMaxLines != null) ? TextOverflow.ellipsis : null),
                  // style: sText,
                ),
                SizedBox(height: 10),
                Text(
                  (blog.regular_price ?? ""),
                  style: theme.textTheme.bodyMedium,
                  maxLines: textMaxLines,
                  overflow: ((textMaxLines != null) ? TextOverflow.ellipsis : null),
                  // style: sText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

