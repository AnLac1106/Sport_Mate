import 'package:flutter/material.dart';

class SPMAvatarBox extends StatelessWidget {
  const SPMAvatarBox(
      {Key? key,
      required this.radius,
      required this.image,
      this.boxShadowColor = Colors.transparent,
      this.spreadRadius = 0})
      : super(key: key);

  final double radius;
  final ImageProvider image;
  final Color boxShadowColor;
  final double spreadRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: boxShadowColor, spreadRadius: spreadRadius)
        ],
        image: DecorationImage(
            image: image, fit: BoxFit.cover),
      ),
    );
  }
}
