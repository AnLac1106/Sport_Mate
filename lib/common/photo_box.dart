import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SPMPhotoBox extends StatelessWidget {
  const SPMPhotoBox({super.key, required this.photo, this.height, this.width});

  final String photo;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      // decoration: BoxDecoration(
      // image: DecorationImage(image: NetworkImage(photo), fit: BoxFit.cover)
      // ),
      child: Image.network(photo,fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
        // return AnimatedSwitcher(duration: const Duration(milliseconds: 800),
        //   child: loadingProgress == null?  child:
        //  const Center(child: CircularProgressIndicator())
        //   );
        if (loadingProgress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      ),
    );
  }
}
