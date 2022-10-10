import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/spm_create_game_detail/spm_create_game_detail.dart';

class SPMAddPic extends GetView<CreateGameCtrl> {
  const SPMAddPic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Add Pictures",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 320,
                      height: 1,
                      color: Colors.black38,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('Add Picture');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 80,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color.fromARGB(255, 155, 155, 155),
                                width: 1.0,
                                style: BorderStyle.solid,
                              )),
                          child: const Icon(Icons.add_photo_alternate_outlined),
                        ),
                        Container(
                          height: 80,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color.fromARGB(255, 155, 155, 155),
                                width: 1.0,
                                style: BorderStyle.solid,
                              )),
                          child: const Icon(Icons.add_photo_alternate_outlined),
                        )
                      ],
                    ),
                  )
                ])));
  }
}
