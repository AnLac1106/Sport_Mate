import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/SPM_Creat_page/spm_create_game.dart';
import 'package:sport_mate/common/spm_text_field.dart';

class SPMPlace extends GetView<CreateGameCtrl> {
  const SPMPlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 120,
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
                    "Place",
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
                  const SPMTextField(
                    maxLine: 1,
                    hintText:
                        'Football Stadium, Hanoi University, Nguyen Trai Street',
                  ),
                ])));
  }
}
