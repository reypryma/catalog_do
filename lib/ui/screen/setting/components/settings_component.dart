import 'package:catalog_do/constant/app_text.dart';
import 'package:catalog_do/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SettingsComponent extends StatefulWidget {
  final IconData icon;
  final Color? color;
  final String text;
  final bool showSwitch;
  final Widget? screen;

  final void Function(BuildContext)? onTap;

  const SettingsComponent({super.key,
    required this.icon,
    required this.text,
    this.color,
    this.onTap,
    this.showSwitch = false,
    this.screen,
  });

  @override
  State<SettingsComponent> createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  final _appTheme = AppTheme();

  @override
  void initState() {
    super.initState();
    _appTheme.addListener(() => setState(() {}));
  }


  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () => widget.onTap!(context),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: skipbutton),
                  child: Icon(widget.icon, color: widget.color),
                ),
                SizedBox(width: 16),
                Expanded(child: AppText.bodySmall(widget.text, fontWeight: 600)),
                if (widget.showSwitch)
                  Switch(
                    activeTrackColor: _appTheme.getTheme().colorScheme.tertiaryFixedDim,
                    inactiveTrackColor: _appTheme.getTheme().scaffoldBackgroundColor,
                    activeColor: Colors.white,
                    value: _appTheme.usedDarkSkin(),
                    onChanged: (value) {
                      _appTheme.toggleTheme(context);
                    },
                  ),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      );
    }
}


const scribblrPrimaryColor = Color(0xFFA4634D);
const secondaryColor = Color(0xFF834F3E);
const indicatorColor = Color(0xFFA97360);
const skipbutton = Color(0xFFF6F0EF);
const resendColor = Color(0xff686c73);
