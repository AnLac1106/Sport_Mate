import 'package:flutter/material.dart';

class SPMSelectBox extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;
  final double borderRadius;
  final Color borderColor;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry? padding;
  final Function()? onTap;

  const SPMSelectBox({
    super.key,
    required this.width,
    required this.height,
    this.color = Colors.white,
    required this.child,
    required this.borderRadius,
    this.borderColor = Colors.grey,
    this.alignment = Alignment.center,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        alignment: alignment,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: color,
            border: Border.all(width: 1, color: borderColor)),
        child: child,
      ),
    );
  }
}
