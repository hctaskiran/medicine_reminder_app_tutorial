import 'package:flutter/material.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';
import 'package:sizer/sizer.dart';



class DwbhText extends StatelessWidget {
  const DwbhText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(bottom: 1.h),
      child: Text(
        'Don\'t worry, \n Be healty.',
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: customTextColors().pinkColor
        ),

      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(bottom: 1.h, left: 5),
      child: Text(
        'Welcome to Daily+',
        style: Theme.of(context).textTheme.titleSmall
      ),
    );
  }
}

// class ZeroText extends StatelessWidget {
//   const ZeroText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       padding: EdgeInsets.only(bottom: 1.h,),
//       child: Text(
//         '1',
//         style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//           color: customTextColors().pinkColor)
//       ),
//     );
//   }
// }


