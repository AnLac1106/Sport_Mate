import 'package:flutter/material.dart';

class SPMButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final String text;
  final Color textColor;
  final Color borderColor;
  void Function() onPress;

  SPMButton({
    super.key,
    this.width = 118,
    this.height = 44,
    this.borderRadius = 13,
    required this.color,
    required this.text,
    this.textColor = const Color(0xff7D7D7D),
    this.borderColor = const Color(0xffC4C4C4),
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size(width, height)),
        foregroundColor: MaterialStateProperty.all<Color>(textColor),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor),
          ),
        ),
      ),
      onPressed: onPress,
      child: Text(text),
    );
    // return TextButton(
    //   onPressed: onPress,
    //   child: Container(
    //     alignment: Alignment.center,
    //     width: width,
    //     height: height,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(borderRadius),
    //       boxShadow: [BoxShadow(color: borderColor, spreadRadius: 1)],
    //       color: color,
    //     ),
    //     child: Text(
    //       text,
    //       style: TextStyle(
    //           color: textColor, fontSize: 18, fontWeight: FontWeight.w700),
    //     ),
    //   ),
    // );
  }
}
