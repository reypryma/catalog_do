import 'package:catalog_do/data/user_data.dart';
import 'package:catalog_do/ui/component/user_avatar.dart';
import 'package:flutter/material.dart';

class CurrentUserAvatar extends StatelessWidget {
  const CurrentUserAvatar({
    Key? key,
    this.onTapAction = "",
    required this.onTap,
  }) : super(key: key);

  final String? onTapAction;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return UserAvatar(user: currentUser);
  }
}
