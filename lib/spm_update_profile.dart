import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_mate/common/spm_avatar_box.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/common/spm_text_style.dart';
import 'package:sport_mate/spm_create_page/spm_create_game.dart';

class SPMUpdateProfile extends GetView<CreateGameCtrl> {
  const SPMUpdateProfile({Key? key}) : super(key: key);

  @override
  CreateGameCtrl get controller => Get.put<CreateGameCtrl>(CreateGameCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SPMColors.secondaryColor,
        elevation: 0.0,
        title: const Text('Update Profile'),
        titleTextStyle: textStyleHeading4.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold),
        centerTitle: false,
        leading: const Icon(Icons.arrow_back_ios_new),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
              color: SPMColors.secondaryColor,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Stack(
                    children: <Widget>[
                      const SPMAvatarBox(
                          diameter: 3.0,
                          image:
                              AssetImage('assets/images/SPM_test_avatar.png'),
                          boxShadowColor: Colors.white,
                          spreadRadius: 2),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: (() => debugPrint('Add a Profile Pic')),
                            child: const Icon(Icons.add_a_photo,
                                color: Colors.white),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: const <Widget>[
                      TextFieldUpdate(
                        labelText: 'Full Name',
                        suffixIcon: Icon(Icons.clear),
                      ),
                      TextFieldUpdate(
                        labelText: 'User Name',
                      ),
                      TextFieldUpdate(
                        labelText: 'Password',
                        suffixIcon: Icon(Icons.remove_red_eye_sharp),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class TextFieldUpdate extends StatelessWidget {
  final bool? obscureText;
  final bool? autofocus;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;

  const TextFieldUpdate({
    Key? key,
    this.obscureText = false,
    this.autofocus = true,
    required this.labelText,
    this.labelStyle,
    this.suffixIcon = const Icon(Icons.clear),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      autofocus: true,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: textStyleHeading4,
          suffixIcon: suffixIcon),
    );
  }
}
