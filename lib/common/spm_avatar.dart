import 'package:flutter/material.dart';

class SPMAvatar extends StatelessWidget {
  final double radius;
  final String name;
  final double height;
  final double width;
  const SPMAvatar(
      {Key? key,
      required this.radius,
      this.name = "assets/images/SPM_test_avatar.png",
      this.height = 60,
      this.width = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            name,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ]);
  }
}