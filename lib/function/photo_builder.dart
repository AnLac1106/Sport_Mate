import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/photo_box.dart';

class PhotoBuilder extends GetView {
  const PhotoBuilder(this.photo, {Key? key}) : super(key: key);
  // final int index;
  final List photo;

  @override
  Widget build(BuildContext context) {
    if (photo.isEmpty) {
      return Container();
    } else if (photo.length == 1) {
      return SizedBox(
        width: Get.width,
        child: SPMPhotoBox(
          photo: photo[0],
          height: Get.width,
        ),
      );
    } else if (photo.length == 2) {
      return SizedBox(
        width: Get.width,
        height: Get.width/2,
        // color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: SPMPhotoBox(
                    photo: photo[0])),
            const SizedBox(
              width: 2,
            ),
            Expanded(
                child: SPMPhotoBox(
                    photo: photo[1])),
          ],
        ),
      );
    } else if (photo.length == 3) {
      return SizedBox(
        width: Get.width,
        height: Get.width/2,
        child: Row(
          children: [
            Expanded(
                child: SPMPhotoBox(
                    photo: photo[0])),
            const SizedBox(
              width: 2,
            ),
            Expanded(
                child: SPMPhotoBox(
                    photo: photo[1])),
            const SizedBox(
              width: 2,
            ),
            Expanded(
                child: SPMPhotoBox(
                    photo: photo[2])),
          ],
        ),
      );
    } else {
      return SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: SPMPhotoBox(
                      photo: photo[0],
                      height: Get.width / 2,
                    )),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                    child: SPMPhotoBox(
                      photo: photo[1],
                      height: Get.width / 2,
                    )),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Expanded(
                    child: SPMPhotoBox(
                      photo: photo[2],
                      height: Get.width / 2,
                    )),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                    child: SPMPhotoBox(
                      photo: photo[3],
                      height: Get.width / 2,
                    )),
              ],
            ),
          ],
        ),
      );
    }
  }
}
