import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sport_mate/common/spm_avatar_box.dart';

class SPMComment extends StatelessWidget {
  const SPMComment(
      {Key? key,
      required this.userAvatar,
      required this.userName,
      required this.createAt,
      required this.userComment})
      : super(key: key);

  final String userAvatar;
  final String userName;
  final int createAt;
  final String userComment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (buildContext, index) {
                return buildComment();
              },
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              // physics: const ScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
            ),
          ),
          // const SizedBox(height: 3,),
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

  Widget buildComment() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SPMAvatarBox(diameter: 32, image: NetworkImage(userAvatar)),
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
                        userName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.more_vert),
                    ],
                  ),
                  Row(children: [
                    Text(DateFormat('dd/MM/yyyy, HH:mm')
                        .format(DateTime.fromMillisecondsSinceEpoch(createAt)))
                  ]),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [Text(userComment)],
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
