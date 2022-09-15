import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sport_mate/common/spm_colors.dart';

class SPMCreateGame extends GetView {
  const SPMCreateGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 90,
                      width: 120,
                      decoration: const BoxDecoration(
                        color: SPMColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.zero,
                          topRight: Radius.circular(100),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 120,
                      decoration: const BoxDecoration(
                        color: SPMColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.zero,
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
