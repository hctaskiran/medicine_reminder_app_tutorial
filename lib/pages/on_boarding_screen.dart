import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../intros/int0.dart';
import '../intros/int1.dart';
import '../intros/int2.dart';
import '../intros/int3.dart';
import 'home_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PAGES
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            
            controller: _controller,
            children: [
              IntroPage0(),
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          Container(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap:() {
                    _controller.jumpToPage(3);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: _customColors().greyColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: _customTexts().skipText
                  )
                ),

                SmoothPageIndicator(
                  controller: _controller, 
                  count: _customCounts().pageCount, 
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.white,
                    activeDotColor: Colors.green
                  )),

                onLastPage ?
                GestureDetector(
                  onTap:() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }  
                     )
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: _customColors().greyColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: _customTexts().doneText
                   )
                  )
                  :
                  GestureDetector(
                  onTap:() {
                    _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: _customColors().greyColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: _customTexts().nextText
                  )
                )
              ],
            ),
          )
        ],
      )
    );
  }
}



class _customCounts {
  final pageCount = 4;
}

class _customColors {
  final greyColor = Colors.grey.shade700;
}

class _customTexts {
  final skipText = Text('Skip', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
  final doneText = Text('Done', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
  final nextText = Text('Next', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
}