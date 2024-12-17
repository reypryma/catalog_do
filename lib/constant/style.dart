import 'package:catalog_do/theme/app_theme.dart';
import 'package:flutter/material.dart';

const double sCardElevation = 3;
Radius sCardRadius = Radius.circular(20.0);
BorderRadius sCardBorderRadius = BorderRadius.circular(20.0);
BorderRadius sImageBorderRadius = BorderRadius.circular(10.0);
EdgeInsets sHorizontalGap = EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0);
EdgeInsets sVerticalGap = EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0);
EdgeInsets sPagePaddingDesktop = EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 20.0);
EdgeInsets sAllSidesGap = EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0);
BorderRadius sFABBorderRadius = BorderRadius.circular(4.0);


/*------------------ General App Typography ------------------*/

TextStyle sHeading2White(BuildContext context) => Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white.withOpacity(0.9));
TextStyle sHeading4White(BuildContext context) => Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white.withOpacity(0.9));
TextStyle sHeading5White(BuildContext context) => Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white.withOpacity(0.9));

TextStyle sHeading3White(BuildContext context) => Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white.withOpacity(0.9));
TextStyle sHeading6White(BuildContext context) => Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white.withOpacity(0.9));

TextStyle sBodyText1White(BuildContext context) => Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white.withOpacity(0.9));

TextStyle sBodyText2White(BuildContext context) => Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white.withOpacity(0.8));

TextStyle sTextLink(BuildContext context) => Theme.of(context).textTheme.bodyLarge!;

TextStyle sText(BuildContext context) => Theme.of(context).textTheme.bodyLarge!;
TextStyle sText2(BuildContext context) => Theme.of(context).textTheme.bodyMedium!;
TextStyle sHeading2(BuildContext context) => Theme.of(context).textTheme.headlineLarge!;
TextStyle sHeading3(BuildContext context) => Theme.of(context).textTheme.headlineMedium!;
TextStyle sHeading4(BuildContext context) => Theme.of(context).textTheme.headlineMedium!;
TextStyle sHeading5(BuildContext context) => Theme.of(context).textTheme.headlineSmall!;
TextStyle sHeading6(BuildContext context) => Theme.of(context).textTheme.headlineSmall!;

Color sTextOnPrimaryColor(BuildContext context) {
  Color color;
  if (Theme.of(context).brightness == Brightness.light) {
    color = Colors.blueGrey[800]!;
  } else {
    color = Colors.white;
  }
  return color;
}

Color sTextOnBrightness(BuildContext context, Brightness brightness) {
  Color color;
  if (brightness == Brightness.light) {
    color = Colors.blueGrey[800]!;
  } else {
    color = Colors.white;
  }
  return color;
}

TextStyle sTitleOverImage(BuildContext context) => Theme.of(context).textTheme.headlineSmall!.copyWith(
  color: Colors.white.withOpacity(0.9),
  backgroundColor: Colors.blueGrey[800]!.withOpacity(0.7),
);

Color sDarkColor = Colors.blueGrey[800]!;


/*------------------ Menu Color ------------------*/

Color sMenuLight = Colors.white;
Color sMenuLightText = Colors.blueGrey[700]!;

Color sMenuDark = Colors.blueGrey[800]!;
Color sMenuDarkText = Colors.blueGrey[100]!;

const sh_cat_1 = Color(0xFFFA4352);
const sh_cat_2 = Color(0xFF34B5C8);
const sh_cat_3 = Color(0xFFFED76D);
const sh_cat_4 = Color(0xFF0C5A93);
const sh_cat_5 = Color(0xFF3CA69B);


/*------------------ Navigation Menu Styles ------------------*/

// Navigation Menu Header colors
TextStyle sNavMenuTitle(BuildContext context) => sHeading6White(context);

TextStyle sNavMenuSubTitle(BuildContext context) => sBodyText1White(context);

TextStyle sNavMenuEdit(BuildContext context) => sBodyText2White(context);

bool sNavMenuCloseButton = false;
bool sSettingsMenuCloseButton = false;

// Navigation Menu Item Text Color

Color sNavMenuItemColor(BuildContext context) {
  // Color color;
  // Color canvasColor = Theme.of(context).canvasColor;
  //
  // if (canvasColor == Theme.of(context).primaryColor) {
  //   if (Theme.of(context).brightness == Brightness.light) {
  //     color = Colors.blueGrey[800]!;
  //   } else {
  //     color = Colors.grey[200]!;
  //   }
  // } else if (canvasColor == sMenuLight) {
  //   color = Colors.blueGrey[800]!;
  // } else {
  //   color = Colors.blueGrey[100]!;
  // }
  // return color;
  return Theme.of(context).colorScheme.tertiary;
}

TextStyle sNavMenuItem(BuildContext context) {
  return Theme.of(context).textTheme.bodyLarge!.copyWith(
    color: sNavMenuItemColor(context),
    fontWeight: FontWeight.w500,
  );
}

Color sNavMenuArrow(BuildContext context) {
  Color color = sNavMenuItemColor(context);

  return color.withOpacity(0.7);
}

// Navigation Menu Item Icon Color
// Color sNavMenuItemIconColor(BuildContext context) {
//   Color color;
//   Color canvasColor = Theme.of(context).canvasColor;
//
//   if (canvasColor == Theme.of(context).primaryColor) {
//     if (Theme.of(context).brightness == Brightness.light) {
//       color = Colors.blueGrey[800]!;
//     } else {
//       color = Colors.grey[200]!;
//     }
//   } else if (Theme.of(context).brightness == Brightness.light) {
//     color = Colors.blueGrey[800]!;
//   } else {
//     color = Colors.white;
//   }
//   return color;
// }

// Navigation Menu Item Icon Decoration
BoxDecoration sNavMenuItemIconDecoration(BuildContext context) {
  Color primaryColor = Theme.of(context).colorScheme.surfaceContainerLowest;

  return BoxDecoration(
    color: primaryColor,
    // borderRadius: BorderRadius.all(Radius.circular(50)),
  );
}

// Navigation Menu Section Heading
TextStyle sNavMenuSectionName(BuildContext context) {
  return Theme.of(context).textTheme.bodyMedium!.copyWith(
    color: Theme.of(context).colorScheme.onTertiaryContainer,
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
  );
}

const double sNavMenuItemIconSize = 18;

Color sNavMenuItemHoverColor(BuildContext context) => Colors.black.withOpacity(.15);
Color sSettingsMenuCardColor(BuildContext context, String type) {
  Color txtcolor;
  Color bgcolor;

  Color canvasColor = Theme.of(context).canvasColor;

  if (canvasColor == Theme.of(context).primaryColor) {
    if (Theme.of(context).brightness != Brightness.light) {
      txtcolor = Colors.blueGrey[100]!;
      bgcolor = Colors.blueGrey[700]!;
    } else {
      txtcolor = Colors.grey[700]!;
      bgcolor = Colors.grey[100]!;
    }
  } else if (canvasColor == sMenuLight) {
    txtcolor = Colors.blueGrey[700]!;
    bgcolor = Colors.blueGrey[100]!;
  } else {
    txtcolor = Colors.blueGrey[100]!;
    bgcolor = Colors.blueGrey[700]!;
  }
  if (type == "bg") {
    return bgcolor;
  } else {
    return txtcolor;
  }
}

TextStyle sSettingsMenuCardText(BuildContext context, [Color? color]) {
  return Theme.of(context).textTheme.labelSmall!.copyWith(
    color: ((color != null) ? color : sSettingsMenuCardColor(context, "text")),
    // color: ((color != null) ? color : ((Theme.of(context).brightness == Brightness.light) ? Colors.blueGrey[800] : Colors.blueGrey[200])),
  );
}

TextStyle sSettingsMenuCardSmallText(BuildContext context, [Color? color]) => Theme.of(context).textTheme.labelSmall!.copyWith(
  fontSize: 10,
  fontStyle: FontStyle.italic,
  color: ((color != null) ? color : sSettingsMenuCardColor(context, "text")),
  // color: ((color != null) ? color : ((Theme.of(context).brightness == Brightness.light) ? Colors.blueGrey[800] : Colors.blueGrey[200])),
);

/*------------------ Avatar and List Text Styles ------------------*/

TextStyle sListAvatarText(BuildContext context, [double size = 18.0]) {
  return Theme.of(context).textTheme.headlineSmall!;
}

const double sAvatarSize = 44.0;
double sAvatarBorderRadius(BuildContext context, double size) => (size / 2);
BoxShadow sAvatarShadow = BoxShadow(
  color: Colors.black.withOpacity(0.2),
  blurRadius: 4,
  offset: Offset(1, 1),
);

/*------------------ Gradient ------------------*/

LinearGradient sBGLinearGradient(BuildContext context, List<Color> colors) {
  return LinearGradient(
    colors: colors,
    begin: const FractionalOffset(0.0, 1.0),
    end: const FractionalOffset(0.0, 0.0),
    stops: [0.0, 1.0],
  );
}

RadialGradient sBGRadialGradient(BuildContext context, List<Color> colors) {
  return RadialGradient(
    center: Alignment(0.0, 0.0), // near the top right
    radius: 0.7,
    colors: colors,
    stops: [0.1, 0.9],
  );
}

/*------------------ Responsive ------------------*/
// BoxConstraints sLandScapeContainer = BoxConstraints(maxWidth: 1200);
// BoxConstraints sPortraitContainer = BoxConstraints(maxWidth: 400);
BoxConstraints sLandScapeForm = BoxConstraints(maxWidth: 600);

/*------------------App Images------------------*/

const String imageSignInPortrait = "assets/images/access-3.jpg";
const String imageSignInLandScape = "assets/images/access-3-ls.jpg";

const String imageSignUpPortrait = "assets/images/access-4.jpg";
const String imageSignUpLandScape = "assets/images/access-4-ls.jpg";

const String imageForgotPasswordPortrait = "assets/images/access-5.jpg";
const String imageForgotPasswordLandScape = "assets/images/access-5-ls.jpg";

const String imageEnterPhonePortrait = "assets/images/access-6.jpg";
const String imageEnterPhoneLandScape = "assets/images/access-6-ls.jpg";

const String imageResetPasswordPortrait = "assets/images/access-7.jpg";
const String imageResetPasswordLandScape = "assets/images/access-7-ls.jpg";

const String imageEnterOtpPortrait = "assets/images/access-11.jpg";
const String imageEnterOtpLandScape = "assets/images/access-11-ls.jpg";


/*------------------App icons------------------*/
const IconData iconLike = Icons.thumb_up;
const IconData iconShare = Icons.share;
const IconData iconMessage = Icons.message;
const IconData iconQuestion = Icons.help_outline;
const IconData iconMore = Icons.more_horiz_sharp;
const IconData iconMenu = Icons.menu;
const IconData iconSettings = Icons.tune;
const IconData iconOTPSent = Icons.phone_android_outlined;
const IconData iconWelcomeToApp = Icons.emoji_emotions_outlined;
const IconData iconPasswordSaved = Icons.lock_outline;
const IconData iconDashboard = Icons.dashboard_outlined;
const IconData iconActivities = Icons.local_activity_outlined;
const IconData iconProfile = Icons.account_circle_outlined;
const IconData iconUsers = Icons.people_outlined;
const IconData iconMessages = Icons.chat_bubble_outline;
const IconData iconFriends = Icons.person_add_outlined;
const IconData iconUserGroups = Icons.groups_outlined;
const IconData iconGallery = Icons.collections_outlined;
const IconData iconFollowers = Icons.person_pin_outlined;
const IconData iconFaqs = Icons.help_outline_outlined;
const IconData iconEditProfile = Icons.manage_accounts_outlined;
const IconData iconWelcome = Icons.home_outlined;
const IconData iconSignIn = Icons.login_outlined;
const IconData iconSignUp = Icons.how_to_reg_outlined;
const IconData iconEnterMobile = Icons.phone_iphone_outlined;
const IconData iconEnterOTP = Icons.dialpad_outlined;
const IconData iconForgotPassword = Icons.lock_open_outlined;
const IconData iconResetPassword = Icons.password_outlined;
const IconData iconTermsConditions = Icons.policy_outlined;
const IconData iconPrivacyPolicy = Icons.verified_user_outlined;
const IconData iconSignOut = Icons.logout_outlined;
const IconData iconSettingsSelect = Icons.check_circle_outlined;
const IconData iconBlogs = Icons.book_outlined;
const IconData iconBlogCategories = Icons.local_activity_outlined;
const IconData iconImage = Icons.image_outlined;
const IconData iconAdd = Icons.add;