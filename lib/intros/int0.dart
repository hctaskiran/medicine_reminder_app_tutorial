import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage0 extends StatefulWidget {
  const IntroPage0({super.key});

  @override
  State<IntroPage0> createState() => _IntroPage0State();
}

class _IntroPage0State extends State<IntroPage0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customPage0Colors().greyColor,
      body: Center(
        child: Column(
          children: [
            
            const SizedBox(height: 200),

            _page0Text(),

            const SizedBox(height: 20,),

            Lottie.network('https://lottie.host/0cec8b88-f922-4684-8ff5-d84f4634610c/Le1FQ8mJwi.json', frameRate: FrameRate(60))
          ],
        ),
      ),
    );
  }
}

class _page0Text extends StatelessWidget {
  const _page0Text({
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
          'Hi! I am here to assist you. Let me explain about this app.',
          textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: customPage0Colors().brownColor)
        )],
      ),
    );
  }
}

class customPage0Colors {
  final whiteColor = Colors.white;
  final brownColor = Colors.brown.shade400;
  final greyColor = Colors.grey.shade300;
  final blackColor = Colors.black;
}