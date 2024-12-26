import 'package:catalog_do/layout/app_text.dart';
import 'package:catalog_do/data/images.dart';
import 'package:catalog_do/layout/app_layout.dart';
import 'package:catalog_do/routes/app_routes.dart';
import 'package:catalog_do/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../constant/variable_constant.dart';
import '../../../layout/responsive.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AppTheme _appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AppScaffold(
        showAppBar: false,
        body: AppContentView(
          showMenu: false,
          mobile: MobileView(
            widget: _buildContent(context),
          ),
          desktop: DesktopView(
            showAppBar: false,
            widget: _buildContent(context),
          ),
        ),
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    var isMobileScreen = (Responsive().deviceType() == "mobile");

    return Container(
      alignment: Alignment.topCenter,
      constraints: isMobileScreen ? null : Responsive().contentAreaWidth(),
      margin: isMobileScreen ? null : EdgeInsets.all(32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: isMobileScreen
              ? Border.all(style: BorderStyle.none)
              : Border.all(
                  color: _appTheme.getTheme().colorScheme.shadow, width: 0.7),
          color: _appTheme.getTheme().colorScheme.primaryContainer),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: isMobileScreen ? 8 : 32, vertical: isMobileScreen ? 8 : 32),
                constraints: BoxConstraints(maxWidth: isMobileScreen ? deviceWidth! * .5 : double.infinity, maxHeight: isMobileScreen ? deviceWidth! * .5 : 600),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage(Images.hey),
                      fit: BoxFit.fitWidth),
                  borderRadius: BorderRadius.all(Radius.circular(25))
                )),
            AppText.headlineSmall("Login", fontWeight: 600),
            SizedBox(height: 12,),
            AppText.bodySmall("Welcome back! Please join with this Socials.", fontWeight: 600),
            SizedBox(height: 12,),
            isMobileScreen ? _loginMobile() : _loginDesktop(),
            SizedBox(height: 12,),
          ],
        ),
      ),
    );
  }

  Widget _loginDesktop(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: SizedBox(
              height: 55,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(PageRoutes.dashboard, (Route<dynamic> route) => false);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: _appTheme.getTheme().colorScheme.onSecondaryFixed,
                ),
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Images.googleLogo, height: 25, width: 25, fit: BoxFit.cover, color:  _appTheme.getTheme().colorScheme.onSecondaryFixed, alignment: Alignment.center),
                    SizedBox(width: 8,),
                    AppText.labelSmall("Sign In With Google", overflow: TextOverflow.clip,)
                  ],
                ),
            ),),
          ),
          SizedBox(width: 16,),
          Flexible(
            flex: 1,
            child: SizedBox(
              height: 55,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(PageRoutes.dashboard, (Route<dynamic> route) => false);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: _appTheme.getTheme().colorScheme.onSurfaceVariant),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Images.appleLogo, height: 25, width: 25, fit: BoxFit.cover, color:  _appTheme.getTheme().colorScheme.onSecondaryFixed, alignment: Alignment.center),
                    SizedBox(width: 8,),
                    AppText.labelSmall("Sign In With Apple", overflow: TextOverflow.clip)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginMobile(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 55,
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(PageRoutes.dashboard, (Route<dynamic> route) => false);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.0, color: _appTheme.getTheme().colorScheme.onSecondaryFixed,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.googleLogo, height: 25, width: 25, fit: BoxFit.cover, color:  _appTheme.getTheme().colorScheme.onSecondaryFixed, alignment: Alignment.center),
                  SizedBox(width: 8,),
                  AppText.labelSmall("Sign In With Google", overflow: TextOverflow.clip,)
                ],
              ),
            ),),
          SizedBox(height: 8,),
          SizedBox(
            height: 55,
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(PageRoutes.dashboard, (Route<dynamic> route) => false);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.0, color: _appTheme.getTheme().colorScheme.onSurfaceVariant),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.appleLogo, height: 25, width: 25, fit: BoxFit.cover, color:  _appTheme.getTheme().colorScheme.onSecondaryFixed, alignment: Alignment.center),
                  SizedBox(width: 8,),
                  AppText.labelSmall("Sign In With Apple", overflow: TextOverflow.clip,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
