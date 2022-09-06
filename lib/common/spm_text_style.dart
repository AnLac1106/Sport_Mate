import 'package:flutter/material.dart';
import 'package:sport_mate/common/spm_colors.dart';

// class TextStyleHeading extends StatefulWidget {
//   String text;
//   final bool inherit;
//   Color? color;
//   Color? backgroundColor;
//   double? fontSize;
//   FontWeight? fontWeight;
//   FontStyle? fontStyle;
//   double? letterSpacing;
//   double? wordSpacing;
//   Decoration? decoration;
//   String? fontFamily;
//   String? overflow;

//   TextStyleHeading({
//     Key? key,
//     required this.text,
//     this.inherit = true,
//     this.color,
//     this.backgroundColor,
//     this.fontSize,
//     this.fontWeight,
//     this.fontStyle,
//     this.letterSpacing,
//     this.wordSpacing,
//     this.decoration,
//     this.fontFamily,
//     this.overflow,
//   }) : super(key: key);

//   @override
//   State<TextStyleHeading> createState() => _TextStyleHeadingState();
// }

// class _TextStyleHeadingState extends State<TextStyleHeading> {
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       "${widget.text}",
//       style: const TextStyle(
//         fontFamily: 'Scope One',
//         fontWeight: FontWeight.bold,
//         fontSize: 30.0,
//         color: AppColor.textColor,
//         letterSpacing: 4.0,
//       ),
//     );
//   }
// }

const textStyleHeading = TextStyle(
  fontFamily: 'Scope One',
  fontWeight: FontWeight.normal,
  fontSize: 48.0,
  color: Colors.black,
  letterSpacing: 2.0,
);

const textStyleHeading1 = TextStyle(
  fontFamily: 'Scope One',
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
  color: SPMColors.secondaryColor,
  letterSpacing: 2.0,
);

const textStyleHeading4 = TextStyle(
  fontFamily: 'Scope One',
  fontWeight: FontWeight.normal,
  fontSize: 18.0,
  color: Colors.black,
  letterSpacing: 1.0,
);

const textStyleNormal = TextStyle(
  fontFamily: 'Scope One',
  fontWeight: FontWeight.normal,
  fontSize: 16.0,
  color: Colors.black,
  letterSpacing: 1.0,
);
