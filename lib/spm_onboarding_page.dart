import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sport_mate/common/spm_button.dart';
import 'package:sport_mate/common/spm_colors.dart';
import 'package:sport_mate/spm_welcome_page.dart';

class SPMOnBoardingPage extends StatefulWidget {
  const SPMOnBoardingPage({Key? key}) : super(key: key);

  @override
  SPMOnBoardingPageState createState() => SPMOnBoardingPageState();
}

class SPMOnBoardingPageState extends State<SPMOnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => SPMWelcomePage()), (route) => false);
  }

  Widget _buildFullscreenImage(String assetName) {
    return Image.asset(
      'assets/images/$assetName',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      rawPages: [
        _buildFullscreenImage('spm_slide_1.png'),
        _buildFullscreenImage('spm_slide_2.png'),
        _buildFullscreenImage('spm_slide_3.png'),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      back: const Icon(Icons.arrow_back),
      skip: SPMButton(
          height: 32,
          width: 64,
          color: SPMColors.primaryColor,
          onPress: () => _onIntroEnd(context),
          child: const Text('Skip',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black87))),
      next: const Icon(
        Icons.arrow_forward,
        color: SPMColors.secondaryColor,
        shadows: [],
      ),
      done: SPMButton(
        height: 32,
        width: 120,
        color: SPMColors.secondaryColor,
        onPress: () => _onIntroEnd(context),
        child: const Text('Get Start',
            style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: SPMColors.primaryColor,
        activeSize: Size(22.0, 10.0),
        activeColor: SPMColors.secondaryColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
