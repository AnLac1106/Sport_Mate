import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sport_mate/common/spm_avatar_box.dart';
import 'package:sport_mate/spm_friend_profile_page.dart';
import 'package:sport_mate/spm_newfeed_page.dart';

final TextEditingController commentCtrl = TextEditingController();

class SPMComment extends GetView {
  @override
  NewFeedPageCtrl get controller => Get.put(NewFeedPageCtrl());

  const SPMComment({
    Key? key,
    // required this.itemCount,
    required this.index,
  }) : super(key: key);

  // final int itemCount;
  final int index;

  @override
  Widget build(BuildContext context) {
    RxList commentList = [].obs;
    commentList.value = controller.getData['data'][index]['comment'];


    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: 700,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Material(
            elevation: 5,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  'Comment',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemBuilder: (buildContext, index) {
                return buildComment(context, index);
              },
              itemCount: commentList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              // physics: const ScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            ),)
          ),
          Container(
            alignment: Alignment.topCenter,
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(width: 4, color: Colors.black12))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SPMAvatarBox(
                    diameter: 32,
                    image: AssetImage('assets/images/spm_test_avatar.png')),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                    controller: commentCtrl,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        isDense: true,
                        hintText: 'Write your comment....',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      if (commentCtrl.text.isNotEmpty) {
                      commentList.add(
                          {
                            "user_name": "Nguyễn Đức Thiện",
                            "user_avatar":
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT2_RbVnuIvAJqyqo-GNU1UTme6kgsVAMhNNALhakpCcpI3IQIohRKMfe4XhmBJA-VxE8&usqp=CAU",
                            "create_at": DateTime.now().millisecondsSinceEpoch,
                            "user_comment": commentCtrl.text,
                          }
                      );}
                      commentCtrl.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.blueAccent,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildComment(context, commentIndex) {
    // return Obx(() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SPMAvatarBox(
              diameter: 32,
              image: NetworkImage(controller.getData['data'][index]['comment']
              [commentIndex]['user_avatar'])),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: Colors.black12,
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const SPMFriendProfilePage()));
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            controller.getData['data'][index]['comment']
                            [commentIndex]['user_name'],
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        const Icon(Icons.more_vert),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.getData['data'][index]['comment']
                                [commentIndex]['user_comment'])
                              ],
                            ))
                      ],
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Like'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Reply'),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(DateFormat('dd/MM/yyyy, HH:mm')
                        .format(DateTime.fromMillisecondsSinceEpoch(
                      controller.getData['data'][index]['comment'][commentIndex]
                      ['create_at'] *
                          1000,
                    )))
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      );
    // });
  }
}
