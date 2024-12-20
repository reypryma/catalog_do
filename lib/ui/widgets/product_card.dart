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


    return Card(
      elevation: sCardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: sCardBorderRadius,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: Container(
          child: ProductItem(blog: blog),
        ),
      ),

    );
    // });
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.blog,
    this.boxDivider,
    this.showComments = false,
    this.showFullText = false,
    this.imageHeight,
    this.textMaxLines,
  }) : super(key: key);

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
                    fit: BoxFit.fill,
                    image: AssetImage("images/shophop/img/products${blog.images![0].src!}" ?? ""),
                  )),
                SizedBox(height: 10),
                Container(
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Padding(
                          //   padding: EdgeInsetsDirectional.only(top: 7.0, end: 13.0),
                          //   child: UserAvatar(
                          //     user: blog.user,
                          //     size: 30,
                          //   ),
                          // ),
                          // Text(
                          //   (blog.user.title),
                          //   style: theme.textTheme.bodyMedium,
                          //   // style: sListTitle(context),
                          // ),
                        ],
                      ),
                      // TimeDifference(from: blog.date),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                // Text(
                //   (blog.text ?? ""),
                //   style: theme.textTheme.bodyMedium,
                //   maxLines: textMaxLines,
                //   overflow: ((textMaxLines != null) ? TextOverflow.ellipsis : null),
                //   // style: sText,
                // ),
                SizedBox(height: 10),
                Row(
                  children: [

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

