import 'package:catalog_do/layout/app_layout.dart';
import 'package:catalog_do/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
    AppTheme appTheme = AppTheme();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [

        ],
      ),
    );
  }
}
