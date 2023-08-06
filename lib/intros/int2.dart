import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customPage2Colors().greyColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200),

            _page2Text(),

            const SizedBox(height: 20),

            Lottie.network('https://lottie.host/2304c971-0737-46f8-ae45-e7d7cd41c554/dkUWw78Tje.json')
          ],
        ),
      ),
    );
  }
}

class _page2Text extends StatelessWidget {
  const _page2Text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: AnimatedTextKit(
        totalRepeatCount: 1,
        pause: Duration(seconds: 30),
        animatedTexts: [TyperAnimatedText(
          'But we aim not to skip your medicine time, without worries.',
          textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: customPage2Colors().brownColor)
        )],
      ),
    );
  }
}

class customPage2Colors {
  final purpleColor = Colors.purple.shade400;
  final whiteColor = Colors.white;
  final greyColor = Colors.grey.shade300;
  final brownColor = Colors.brown.shade400;
}
