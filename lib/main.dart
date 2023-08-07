import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';
import 'package:medicine_reminder_app_tutorial/pages/home_page.dart';
import 'package:medicine_reminder_app_tutorial/pages/on_boarding_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String appBarTitle = 'Care Your Health';
  final bool debugFalse = false; 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, Orientation, DeviceType) {
      return MaterialApp(
        title: appBarTitle,
        theme: ThemeData.dark().copyWith(
          primaryColor: customPrimaryColor,
          scaffoldBackgroundColor: customScaffoldColor,
          appBarTheme: customAppBar(),
          textTheme: customTextTheme(),
          inputDecorationTheme: customInputDecoration(),
        ),
        debugShowCheckedModeBanner: debugFalse,
        home: const HomePage(),
      );
    });
  }

  InputDecorationTheme customInputDecoration() {
    // enabledBorder
    final enabledColor = customTextColors().grey500color;
    final double enabledWidht = 0.7;
    // secondBorder
    final borderColor = customTextColors().grey500color;
    // focusedBorder
    final focusedColor = customTextColors().cyanColor;

    return InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: enabledColor, 
                width: enabledWidht),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: borderColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: focusedColor),
            ));
  }

  TextTheme customTextTheme() {

    // headlineMedium
    final double hmSize = 30;
    final hmWeight = FontWeight.bold;
    final hmColor = customTextColors().pinkColor;

    // titleSmall
    final tsSize = 16.sp;
    final tsColor = customTextColors().purpleColor;

    // bodySmall
    final bsSize = 9.sp;
    final bsWeight = FontWeight.w500;
    final bsColor = customTextColors().cyanColor;

    // titleLarge = 
    final double tlSize = 24;
    final tlColor = customTextColors().redColor;
    final tlWeight = FontWeight.w400;

    // labelMedium
    final lmSize = 10.sp;
    final lmWeight = FontWeight.w500;
    final lmColor = customTextColors().blackColor;

    return TextTheme(
          headlineMedium: TextStyle(
            fontSize: hmSize, 
            fontWeight: hmWeight, 
            color: hmColor),
          titleSmall: GoogleFonts.poppins(
            fontSize: tsSize, 
            color: tsColor),
          bodySmall: GoogleFonts.poppins(
            fontSize: bsSize,
            fontWeight: bsWeight,
            color: bsColor),
          titleLarge: TextStyle(
            fontSize: tlSize, 
            color: tlColor, 
            fontWeight: tlWeight),
          labelMedium: TextStyle(
            fontSize: lmSize, 
            fontWeight: lmWeight, 
            color: lmColor),
        );
  }

  AppBarTheme customAppBar() {
    // appBar
    final tbHeight = 7.h;
    final double zeroElev = 0;
    final bgColor = customScaffoldColor;

    // iconTheme
    final iconTcolor = customTextColors().redColor;
    final iconTsize = 20.sp;

    // titleTextStyle
    final ttColor = customTextColors().blackColor;
    final ttWeight = FontWeight.w800;
    final ttStyle = FontStyle.normal;
    final ttSize = 16.sp;

    return AppBarTheme(
            toolbarHeight: tbHeight,
            backgroundColor: bgColor,
            elevation: zeroElev,
            iconTheme: IconThemeData(
              color: iconTcolor, 
              size: iconTsize),
            titleTextStyle: GoogleFonts.mulish(
                color: ttColor,
                fontWeight: ttWeight,
                fontStyle: ttStyle,
                fontSize: ttSize));
  }
}


