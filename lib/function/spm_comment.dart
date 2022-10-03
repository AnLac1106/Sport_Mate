import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sport_mate/common/spm_avatar_box.dart';
import 'package:sport_mate/spm_newfeed_page.dart';

class SPMComment extends GetView {
  @override
  NewFeedPageCtrl get controller => Get.put(NewFeedPageCtrl());

  const SPMComment(
      {Key? key,
      required this.itemCount,
      required this.index,
      })
      : super(key: key);

  final int itemCount;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (buildContext, index) {
                return buildComment(index);
              },
              itemCount: itemCount,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              // physics: const ScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(width: 4, color: Colors.black12))),
            child: Row(
              children: [
                const SPMAvatarBox(diameter: 32, image: AssetImage('assets/images/avatar2.jpg')),
                const SizedBox(width: 8,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      isDense: true,
                      hintText: 'Write your comment....',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                    ),
                  ),
                ),
                const SizedBox(width: 8,),
                IconButton(
                  padding: const EdgeInsets.all(0),
                    onPressed: () {}, icon: const Icon(Icons.arrow_right, size: 50,))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildComment(commentIndex) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SPMAvatarBox(diameter: 32,
            image: NetworkImage(controller.getData['data'][index]['comment'][commentIndex]['user_avatar'])),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.black12,
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.getData['data'][index]['comment'][commentIndex]['user_name'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.more_vert),
                    ],
                  ),
                  Row(children: [
                    Text(DateFormat('dd/MM/yyyy, HH:mm')
                        .format(DateTime.fromMillisecondsSinceEpoch(
                      controller.getData['data'][index]['comment'][commentIndex]['create_at']*1000,
                    )))
                  ]),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(controller.getData['data'][index]['comment'][commentIndex]['user_comment'])],
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
  }
}
