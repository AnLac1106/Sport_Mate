import 'package:flutter/material.dart';

class SPMAvatarBox extends StatelessWidget {
  const SPMAvatarBox(
      {Key? key,
      required this.diameter,
      required this.image,
      this.boxShadowColor = Colors.transparent,
      this.spreadRadius = 0})
      : super(key: key);

  final double diameter;
  final ImageProvider image;
  final Color boxShadowColor;
  final double spreadRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
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
