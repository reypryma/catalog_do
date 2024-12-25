import 'package:catalog_do/constant/style_constant.dart';
import 'package:catalog_do/data/model/user.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final User user;
  final bool? onTapGoToProfile;
  final double? size;
  final double? radius;
  final BoxShadow? shadow;
  const UserAvatar({super.key,
    required this.user,
    this.onTapGoToProfile = true,
    this.size,
    this.radius,
    this.shadow,
  });
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double imageSize = size ?? sAvatarSize;

    double imageRadius = radius ?? sAvatarBorderRadius(context, imageSize);

    BoxShadow imageShadow = shadow ?? sAvatarShadow;

    String userImage = user.image ?? "";

    String userTitle = user.title;
    if(userTitle != ""){
      userTitle = userTitle[0];
    }

    // bool userImageType = isNetworkUrl(userImage);

    return MouseRegion(
      cursor: ((onTapGoToProfile == true) ? SystemMouseCursors.click : SystemMouseCursors.basic),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(imageRadius),
            boxShadow: [imageShadow],
          ),
          child: ((userImage != "")
              ? ClipRRect(
            borderRadius: BorderRadius.circular(imageRadius),
            child: Image.asset(
              userImage,
              height: imageSize,
              width: imageSize,
              fit: BoxFit.fill,
            ),
          )
              : ClipRRect(
            borderRadius: BorderRadius.circular(imageRadius),
            child: Container(
              color: theme.primaryColor,
              height: imageSize,
              width: imageSize,
              child: Center(
                child: Text(
                  userTitle,
                  style: sListAvatarText(context, imageSize / 3),
                ),
              ),
            ),
          ))),
        ),
    );
  }
}
