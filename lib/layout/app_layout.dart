import 'package:catalog_do/layout/responsive.dart';
import 'package:catalog_do/ui/widgets/app_background.dart';
import 'package:catalog_do/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../constant/style_constant.dart';
import '../ui/navigation/navigation_menu.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final String menu;
  final bool? settings;
  final String backButton;
  final bool? showAppBar;
  final bool hasTabs;
  final int tabsLength;
  final bool? showFAB;
  final Function? onPressFAB;
  final IconData? iconFAB;
  final Color? colorFAB;
  final List<Widget>? topBarActions;
  final List<Widget>? topBarLeadingActions;
  final bool? centerAlignAppBar;
  final double? appBarleadingWidth;
  final bool? showSettingsMenu;
  final bool? invisibleAppBar;
  final bool? confirmAppExit;
  final Function? onTapTitle;

  const AppScaffold({
    super.key,
    this.title = "",
    required this.body,
    this.menu = "",
    this.settings = true,
    this.backButton = "",
    this.showAppBar,
    this.hasTabs = false,
    this.tabsLength = 0,
    this.showFAB = false,
    this.onPressFAB,
    this.iconFAB,
    this.colorFAB,
    this.topBarActions,
    this.topBarLeadingActions,
    this.centerAlignAppBar = false,
    this.appBarleadingWidth,
    this.showSettingsMenu = true,
    this.invisibleAppBar = false,
    this.confirmAppExit = false,
    this.onTapTitle,
  });

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold;
    Widget widget;

    if (showAppBar == false) {
      scaffold = Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        body: body,
      );

      widget = scaffold;
    } else {
      scaffold = Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        appBar: ((Responsive().deviceType() != "desktop" &&
                invisibleAppBar == false)
            ? CustomAppBar(
                title: GestureDetector(
                  child: Text(title),
                  onTap: () {
                    if (onTapTitle != null) {
                      onTapTitle!();
                    }
                  },
                ),
                menu: menu,
                backButton: backButton,
                settings: settings ?? true,
                topBarActions: topBarActions,
                topBarLeadingActions: topBarLeadingActions,
                centerAlign: centerAlignAppBar,
                leadingWidth: appBarleadingWidth,
              )
            : PreferredSize(
                preferredSize: Size(0.0, 0.0),
                child: Container(),
              )),
        drawer: ((Responsive().deviceType() != "desktop")
            ? NavigationMenu()
            : null),
        endDrawer: null,
        // body: body,
        body: LayoutBuilder(builder: (context, _) {
          Widget bodyWidget = AppBackground(body: body);

          return Container(
            child: bodyWidget,
          );
        }),
        floatingActionButton: (showFAB != null &&
                showFAB! &&
                onPressFAB != null)
            ? FloatingActionButton(
                onPressed: () {
                  onPressFAB!();
                },
                backgroundColor: colorFAB ?? Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(borderRadius: sFABBorderRadius),
                child: Icon(iconFAB),
              )
            : null,
      );

      widget = scaffold;

      if (hasTabs == true) {
        widget = DefaultTabController(
          length: tabsLength,
          child: scaffold,
        );
      }
    }

    return SafeArea(
      child: widget,
    );
  }
}

class AppContentView extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final String? title;
  final bool showMenu;

  const AppContentView(
      {super.key,
      required this.mobile,
      this.desktop,
      this.tablet,
      this.title,
      this.showMenu = true});

  @override
  Widget build(BuildContext context) {
    debugPrint("responsive ${Responsive().deviceType()} status $showMenu");
    // Desktop View
    if (Responsive().deviceType() == "desktop" && showMenu == true) {
      return Row(
        children: [
          NavigationMenu(),
          Expanded(
            child: desktop ?? mobile,
          ),
        ],
      );
    } else if (Responsive().deviceType() == "desktop" && showMenu == false) {
      return desktop ?? mobile;
    }

    // Tablet View
    else if (Responsive().deviceType() == "tablet") {
      return tablet ?? mobile;
    }
    // Default Mobile View
    else {
      return mobile;
    }
  }
}

class MobileView extends StatelessWidget {
  final Widget widget;

  const MobileView({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: widget,
    );
  }
}

class TabletView extends StatelessWidget {
  final Widget widget;

  const TabletView({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: widget,
    );
  }
}

class DesktopView extends StatelessWidget {
  final String title;
  final Widget widget;
  final String menu;
  final String backbutton;
  final bool showAppBar;
  final bool? invisibleAppBar;

  const DesktopView({
    super.key,
    required this.widget,
    this.title = "",
    this.menu = "hide",
    this.backbutton = "",
    this.showAppBar = true,
    this.invisibleAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    if (showAppBar == false || invisibleAppBar == true) {
      return Container(
        alignment: Alignment.topCenter,
        child: widget,
      );
    } else {
      return Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(
            title: Text(title),
            menu: menu,
            backButton: backbutton,
            viewOn: "desktop",
          ),
          Expanded(
            child: widget,
          )
        ],
      );
    }
  }
}
