import 'package:catalog_do/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? fontWeight;
  final bool muted, xMuted;
  final double? letterSpacing;
  final Color? color;
  final TextDecoration decoration;
  final double? height;
  final double wordSpacing;
  final double? fontSize;
  final MyTextType textType;
  final TextAlign? textAlign;
  final int? maxLines;
  final Locale? locale;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  const AppText(this.text,
      {super.key,
      this.style,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing = 0.15,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.bodyMedium,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.displayLarge(this.text,
      {super.key,
      this.style,
      this.fontWeight,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.displayLarge,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.displayMedium(this.text,
      {super.key,
      this.style,
      this.fontWeight,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.displayMedium,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.displaySmall(this.text,
      {super.key,
      this.style,
      this.fontWeight,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.displaySmall,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.headlineLarge(this.text,
      {super.key,
      this.style,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.headlineLarge,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.headlineMedium(this.text,
      {super.key,
      this.style,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.headlineMedium,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.headlineSmall(this.text,
      {super.key,
      this.style,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.headlineSmall,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.titleLarge(this.text,
      {super.key,
      this.style,
      this.fontWeight,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.titleLarge,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.titleMedium(this.text,
      {super.key,
      this.style,
      this.fontWeight,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.titleMedium,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.titleSmall(this.text,
      {super.key,
      this.style,
      this.fontWeight,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.titleSmall,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.labelLarge(this.text,
      {super.key,
      this.style,
      this.fontWeight,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.labelLarge,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.labelMedium(this.text,
      {super.key,
      this.style,
      this.fontWeight,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.labelMedium,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.labelSmall(this.text,
      {super.key,
      this.style,
      this.fontWeight,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.labelSmall,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.bodyLarge(this.text,
      {super.key,
      this.style,
      this.fontWeight,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.bodyLarge,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.bodyMedium(this.text,
      {super.key,
      this.style,
      this.fontWeight,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.bodyMedium,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const AppText.bodySmall(this.text,
      {super.key,
      this.style,
      this.fontWeight,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.textType = MyTextType.bodySmall,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          AppText.getStyle(
            textStyle: style,
            color: color,
            fontWeight:
                fontWeight ?? AppText._defaultTextFontWeight[textType] ?? 500,
            muted: muted,
            letterSpacing:
                letterSpacing ?? AppText._defaultLetterSpacing[textType] ?? 0.15,
            height: height,
            xMuted: xMuted,
            decoration: decoration,
            wordSpacing: wordSpacing,
            fontSize: fontSize ?? AppText._defaultTextSize[textType],
          ),
      textAlign: textAlign,
      maxLines: maxLines,
      locale: locale,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textWidthBasis: textWidthBasis,
      key: key,
    );
  }

  static TextStyle getStyle(
      {TextStyle? textStyle,
      int? fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    double? finalFontSize =
        fontSize ?? (textStyle == null ? 40 : textStyle.fontSize);

    Color finalColor = color ?? AppTheme().getTheme().colorScheme.onSurface;
    finalColor = xMuted
        ? finalColor.withAlpha(160)
        : (muted ? finalColor.withAlpha(200) : finalColor);

    return TextStyle(
        fontSize: finalFontSize,
        fontWeight: _defaultFontWeight[fontWeight],
        letterSpacing: letterSpacing,
        color: finalColor,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }

  static final Map<int, FontWeight> _defaultFontWeight = {
    100: FontWeight.w100,
    200: FontWeight.w200,
    300: FontWeight.w300,
    400: FontWeight.w300,
    500: FontWeight.w400,
    600: FontWeight.w500,
    700: FontWeight.w600,
    800: FontWeight.w700,
    900: FontWeight.w800,
  };

  static final Map<MyTextType, double> _defaultTextSize = {
    MyTextType.displayLarge: 57,
    MyTextType.displayMedium: 45,
    MyTextType.displaySmall: 36,
    MyTextType.headlineLarge: 32,
    MyTextType.headlineMedium: 28,
    MyTextType.headlineSmall: 26,
    MyTextType.titleLarge: 22,
    MyTextType.titleMedium: 16,
    MyTextType.titleSmall: 14,
    MyTextType.labelLarge: 14,
    MyTextType.labelMedium: 12,
    MyTextType.labelSmall: 11,
    MyTextType.bodyLarge: 16,
    MyTextType.bodyMedium: 14,
    MyTextType.bodySmall: 12,
  };

  static final Map<MyTextType, int> _defaultTextFontWeight = {
    MyTextType.displayLarge: 500,
    MyTextType.displayMedium: 500,
    MyTextType.displaySmall: 500,
    MyTextType.headlineLarge: 500,
    MyTextType.headlineMedium: 500,
    MyTextType.headlineSmall: 500,
    MyTextType.titleLarge: 500,
    MyTextType.titleMedium: 500,
    MyTextType.titleSmall: 500,
    MyTextType.labelLarge: 600,
    MyTextType.labelMedium: 600,
    MyTextType.labelSmall: 600,
    MyTextType.bodyLarge: 500,
    MyTextType.bodyMedium: 500,
    MyTextType.bodySmall: 500,
  };

  static final Map<MyTextType, double> _defaultLetterSpacing = {
    MyTextType.displayLarge: -0.25,
    MyTextType.displayMedium: 0,
    MyTextType.displaySmall: 0,
    MyTextType.headlineLarge: -0.2,
    MyTextType.headlineMedium: -0.15,
    MyTextType.headlineSmall: 0,
    MyTextType.titleLarge: 0,
    MyTextType.titleMedium: 0.1,
    MyTextType.titleSmall: 0.1,
    MyTextType.labelLarge: 0.1,
    MyTextType.labelMedium: 0.5,
    MyTextType.labelSmall: 0.5,
    MyTextType.bodyLarge: 0.5,
    MyTextType.bodyMedium: 0.25,
    MyTextType.bodySmall: 0.4,
  };
}

enum MyTextType {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}
