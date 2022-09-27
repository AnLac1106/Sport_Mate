import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sport_mate/common/spm_button.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/function/photo_builder.dart';

import 'function/post_api.dart';


class NewFeedPageCtrl extends GetxController {
  RxMap getData = {}.obs;
  RxBool isLoading = true.obs;

  Future<void> callAPI() async {
    isLoading(true);
    final PostAPI postAPI = PostAPI();
    var apiData = await postAPI.getData();
    if (apiData != null) {
      getData.value = apiData;
    }
    isLoading(false);
  }

  @override
  void onInit() {
    callAPI();
    super.onInit();
  }
}

class SPMNewFeedPage extends GetView<NewFeedPageCtrl> {
  const SPMNewFeedPage({Key? key}) : super(key: key);

  @override
  NewFeedPageCtrl get controller => Get.put(NewFeedPageCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/avatar1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Color(0xffeff3f7)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Color(0xffeff3f7)),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.all(0),
                          filled: true,
                          fillColor: const Color(0xffeff3f7),
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return buildItem(index);
                    },
                    itemCount: controller.getData['data'].length,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(index) {
    // PhotoBuilder photoBuilder = PhotoBuilder(index);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${controller.getData['data'][index]['avatar']}'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Colors.green, spreadRadius: 1.5)
                            ],
                            image: DecorationImage(
                                image: AssetImage('assets/images/football.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.getData['data'][index]['name']}',
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy, HH:mm')
                            .format(DateTime.fromMillisecondsSinceEpoch(
                                controller.getData['data'][index]['create_at']))
                            .toString(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Place: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Time: ${DateFormat('dd/MM/yyyy, HH:mm').format(DateTime.fromMillisecondsSinceEpoch(controller.getData['data'][index]['create_at'])).toString()}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Level: ${controller.getData['data'][index]['level']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Partner needed: ${controller.getData['data'][index]['partner needed']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${controller.getData['data'][index]['last_message']}',
                  // style: Get.textTheme.bodyText1,
                ),
              ),
              PhotoBuilder(controller.getData['data'][index]['photos']),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.thumb_up,
                      color: Colors.blueAccent,
                      size: 16,
                    ),
                    const Text(
                      '  7',
                    ),
                    const Expanded(child: SizedBox()),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        '2 comments',
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 12,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () {},
                        child: Column(
                          children: const [
                            Icon(Icons.thumb_up),
                            Text(
                              'Like',
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () {},
                        child: Column(
                          children: const [
                            Icon(Icons.comment),
                            Text(
                              'Comment',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: RawMaterialButton(
                        // alignment: Alignment.center,
                        onPressed: () {},
                        child: Column(
                          children: const [
                            Icon(Icons.turn_right),
                            Text(
                              'Share',
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SPMButton(
                          color: SPMColors.primaryColor,
                          borderColor: SPMColors.primaryColor,
                          onPress: () {},
                          child: Text(
                            'Request game',
                            style: Get.textTheme.bodyText1,
                          )),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          color: const Color(0xffe9e6e0),
          height: 5,
        ),
      ],
    );
  }

// Widget buildPhoto() {
//   if (controller.photo.isEmpty) {
//     return Container();
//   } else if (controller.photo.length == 1) {
//     return SizedBox(
//       width: Get.width,
//       child: SPMPhotoBox(photo: controller.photo[0]),
//     );
//   } else if (controller.photo.length == 2) {
//     return SizedBox(
//       width: Get.width,
//       child: Row(
//         children: [
//           Expanded(child: SPMPhotoBox(photo: controller.photo[0])),
//           const SizedBox(
//             width: 2,
//           ),
//           Expanded(child: SPMPhotoBox(photo: controller.photo[1])),
//         ],
//       ),
//     );
//   } else if (controller.photo.length == 3) {
//     return SizedBox(
//       width: Get.width,
//       child: Row(
//         children: [
//           Expanded(child: SPMPhotoBox(photo: controller.photo[0])),
//           const SizedBox(
//             width: 2,
//           ),
//           Expanded(child: SPMPhotoBox(photo: controller.photo[1])),
//           const SizedBox(
//             width: 2,
//           ),
//           Expanded(child: SPMPhotoBox(photo: controller.photo[2])),
//         ],
//       ),
//     );
//   } else {
//     return SizedBox(
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                   child: SPMPhotoBox(
//                 photo: controller.photo[0],
//                 height: Get.width / 2,
//               )),
//               const SizedBox(
//                 width: 2,
//               ),
//               Expanded(
//                   child: SPMPhotoBox(
//                 photo: controller.photo[1],
//                 height: Get.width / 2,
//               )),
//             ],
//           ),
//           const SizedBox(
//             height: 2,
//           ),
//           Row(
//             children: [
//               Expanded(
//                   child: SPMPhotoBox(
//                 photo: controller.photo[2],
//                 height: Get.width / 2,
//               )),
//               const SizedBox(
//                 width: 2,
//               ),
//               Expanded(
//                   child: SPMPhotoBox(
//                 photo: controller.photo[3],
//                 height: Get.width / 2,
//               )),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
}
