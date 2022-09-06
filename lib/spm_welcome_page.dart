import 'package:flutter/material.dart';
import 'package:sport_mate/common/spm_colors.dart';

import 'common/spm_button.dart';

class SPMWelcomePage extends StatefulWidget {
  const SPMWelcomePage({Key? key}) : super(key: key);

  @override
  State<SPMWelcomePage> createState() => _SPMWelcomePageState();
}

class _SPMWelcomePageState extends State<SPMWelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
                'https://images.all-free-download.com/images/graphiclarge/sports_background_ball_games_icons_decor_6836428.jpg'),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            top: MediaQuery.of(context).size.width * 0.55,
            child: Container(
              padding: const EdgeInsets.only(left: 42, right: 42, top: 42),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffA6D36D),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Please login with your infomation',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const TextField(),
                  const SizedBox(
                    height: 32,
                  ),
                  const TextField(),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Forgot password',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black,
                            decorationThickness: 1.5,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SportMateButton(
                        color: SPMColors.secondaryColor,
                        text: 'Login',
                        textColor: Colors.white,
                        width: 225,
                        height: 48,
                        onPress: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  RichText(
                    text: const TextSpan(
                        text: 'Don\'t have any account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Register now',
                            style: TextStyle(color: Colors.red),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
