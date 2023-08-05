import 'package:flutter/material.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';
import 'package:medicine_reminder_app_tutorial/components/custom_app_bar.dart';
import 'package:medicine_reminder_app_tutorial/components/custom_texts.dart';
import 'package:medicine_reminder_app_tutorial/pages/new_entry_page.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            const FirstContainer(),
            SizedBox(height: 2.h),
            const Flexible(child: SecondContainer()),
          ],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const NewEntry()),
            ),
          );
        },
        child: SizedBox(
          width: 18.w,
          child: Card(
            color: customTextColors().greenColor,
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3.h)),
            child: Icon(
              Icons.add,
              color: customPrimaryColor,
              size: 50.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class FirstContainer extends StatelessWidget {
  const FirstContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // TOP CONTAINER
        //
        DwbhText(),
        WelcomeText(),
        SizedBox(
          height: 2.h,
        ),
        ZeroText(),
      ],
    );
  }
}

class SecondContainer extends StatelessWidget {
  const SecondContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'You haven\'t saved any medicine yet.',
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
