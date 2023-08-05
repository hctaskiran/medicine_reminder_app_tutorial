import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';
import 'package:medicine_reminder_app_tutorial/pages/home_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, Orientation, DeviceType) {
      return MaterialApp(
        title: 'Care Your Health',
        theme: ThemeData.dark().copyWith(
          primaryColor: customPrimaryColor,
          scaffoldBackgroundColor: customScaffoldColor,
          appBarTheme: AppBarTheme(
              toolbarHeight: 7.h,
              backgroundColor: customScaffoldColor,
              elevation: 0,
              iconTheme: IconThemeData(color: customTextColors().redColor, size: 20.sp),
              titleTextStyle: GoogleFonts.mulish(
                  color: customTextColors().blackColor,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  fontSize: 16.sp)),
          textTheme: TextTheme(
            headlineMedium: TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.bold, 
              color: customTextColors().pinkColor),
            titleSmall: GoogleFonts.poppins(
              fontSize: 16.sp, 
              color: customTextColors().purpleColor),
            titleLarge: TextStyle(
              fontSize: 24, 
              color: customTextColors().redColor, 
              fontWeight: FontWeight.w400),
            labelMedium: TextStyle(
              fontSize: 10.sp, 
              fontWeight: FontWeight.w500, 
              color: customTextColors().blackColor),
          ),
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: customTextColors().grey500color, 
                  width: 0.7),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: customTextColors().grey500color),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: customTextColors().cyanColor),
              )),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      );
    });
  }
}
