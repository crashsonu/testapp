// All Flutter Built-in Imports Here.

// All Custom Imports Here.

// All Native Imports Here.

// All Attributes or Constants Here.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/constants/color.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool bold;
  final Color color;
  final double textSize;
  final double? lineHeight;
  final FontWeight? fontWeight;
  final TextOverflow overflow;
  final TextStyle? textStyle;
  final Color? textShadow;
  final bool selectable;

  const CustomText(
      {super.key,
      required this.text,
      this.bold = false,
      this.color = AppColors.darkTextColor,
      this.textSize = 15,
      this.fontWeight,
      this.lineHeight,
      this.overflow = TextOverflow.clip,
      this.selectable = false,
      this.textStyle,
      this.textShadow});

  @override
  Widget build(BuildContext context) {
    return SelectableText(text,
        style: textStyle ??
            GoogleFonts.inter(
                textStyle: TextStyle(
                    overflow: overflow,
                    shadows: [
                      if (textShadow != null)
                        Shadow(
                          color: textShadow!,
                          offset: const Offset(2, 2),
                          blurRadius: 2,
                        ),
                    ],
                    fontWeight:
                        bold ? fontWeight ?? FontWeight.w600 : FontWeight.w500,
                    fontSize: textSize,
                    color: color,
                    letterSpacing: bold
                        ? fontWeight != null
                            ? 2
                            : 0.9
                        : 0.8,
                    height: lineHeight ?? 1.3)));
  }
}

class HeaderText extends StatelessWidget {
  final String text;
  final bool bold;
  final Color color;
  final double? textSize;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final Color? textShadow;
  final bool selectable;

  const HeaderText(
      {super.key,
      required this.text,
      this.bold = true,
      this.color = AppColors.darkTextColor,
      this.textSize,
      this.fontWeight,
      this.overflow = TextOverflow.clip,
      this.selectable = false,
      this.textShadow});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustomText(
      text: text,
      bold: bold,
      fontWeight: fontWeight,
      color: color,
      textSize: textSize == null
          ? width > 600
              ? textSize ?? 17
              : 17
          : textSize!,
      overflow: overflow,
      textShadow: textShadow,
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;
  final bool bold;
  final Color color;
  final double? textSize;
  final double? lineHeight;
  final FontWeight? fontWeight;
  final TextOverflow overflow;
  final Color? textShadow;
  final bool selectable;

  const NormalText(
      {super.key,
      required this.text,
      this.bold = false,
      this.color = AppColors.darkTextColor,
      this.textSize,
      this.lineHeight,
      this.fontWeight,
      this.overflow = TextOverflow.clip,
      this.selectable = false,
      this.textShadow});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return CustomText(
      text: text,
      bold: bold,
      color: color,
      lineHeight: lineHeight ?? 1.8,
      fontWeight: fontWeight,
      textSize: textSize == null
          ? width > 600
              ? 16
              : 14
          : textSize!,
      overflow: overflow,
      textShadow: textShadow,
      selectable: selectable,
    );
  }
}
