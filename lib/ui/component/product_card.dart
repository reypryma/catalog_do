import 'package:catalog_do/constant/style.dart';
import 'package:catalog_do/data/model/product.dart';
import 'package:catalog_do/ui/component/user_avatar.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
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
          child: BlogItem(blog: blog),
        ),
      ),

    );
    // });
  }
}

class BlogItem extends StatelessWidget {
  const BlogItem({
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
    List<Widget> displayComments = [];
    List<Widget> displayFullText = [];
    int fullTextCount = 0;
    //
    // // Full Text
    // if (showFullText == true && blog.fullText != null && blog.fullText!.isNotEmpty) {
    //   blog.fullText!.forEach((t) {
    //     fullTextCount++;
    //     displayFullText.add(
    //       Padding(
    //         padding: fullTextCount == blog.fullText!.length ? const EdgeInsets.only(bottom: 0.0) : const EdgeInsets.only(bottom: 15.0),
    //         child: Text(
    //           (t ?? ""),
    //           style: theme.textTheme.bodyMedium,
    //           // maxLines: textMaxLines,
    //           // overflow: ((textMaxLines != null) ? TextOverflow.ellipsis : null),
    //           // style: sText,
    //         ),
    //       ),
    //     );
    //   });
    // }

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
                // ClipRRect(
                //   borderRadius: sImageBorderRadius,
                //   child: ((imageHeight != null)
                //       ? Image(
                //     height: imageHeight,
                //     fit: BoxFit.cover,
                //     image: AssetImage(blog.images?[0].name ?? ""),
                //   )
                //       : Image(
                //     fit: BoxFit.fill,
                //     image: AssetImage(blog.media ?? ""),
                //   )),
                // ),
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

