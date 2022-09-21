
import 'package:flutter/material.dart';

class SPMPhotoBox extends StatelessWidget {
  const SPMPhotoBox({super.key, required this.photo, this.height, this.width});

  final String photo;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
    image: DecorationImage(image: NetworkImage(photo), fit: BoxFit.cover)
    ),
    );
  }
}
