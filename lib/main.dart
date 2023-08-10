import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';
import 'package:medicine_reminder_app_tutorial/components/global_block.dart';
import 'package:medicine_reminder_app_tutorial/pages/home_page.dart';
import 'package:medicine_reminder_app_tutorial/pages/on_boarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'components/entry_block.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String appBarTitle = 'Care Your Health';

  final bool debugFalse = false; 

  GlobalBlock? globalBlock;

  @override
  void initState() {
    super.initState();
    globalBlock = GlobalBlock();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBlock>.value(
      value: globalBlock!,
      child: Sizer(builder: (context, Orientation, DeviceType) {
      return MaterialApp(
        title: appBarTitle,
        theme: ThemeData.dark().copyWith(
          primaryColor: customPrimaryColor,
          scaffoldBackgroundColor: customScaffoldColor,
          appBarTheme: customAppBar(),
          textTheme: customTextTheme(),
          inputDecorationTheme: customInputDecoration(),
          timePickerTheme: customTimePickerTheme()
          ),
        debugShowCheckedModeBanner: debugFalse,
        home: const HomePage(),
      );
    }),
   );
  }

  TimePickerThemeData customTimePickerTheme() {
    // helptext
    final helpTextStyle = TextStyle(color: customTextColors().blackColor);
    // background
    final bgColor = customScaffoldColor;
    // hour-minute
    final hoMiColor = customTextColors().brownColor;
    final hoMiTextColor = customScaffoldColor;
    // day-period
    final dpColor = customTextColors().brownColor;
    final dpTextColor = customScaffoldColor;
    // day-period text style
    final dpTextStyle = GoogleFonts.abyssinicaSil(fontSize: 10.sp);
    // dial
    final dialBG = customTextColors().transparent;
    final dhColor = customTextColors().cyanColor;
    final dtColor = customTextColors().blackColor;
    // entry
    final entryIconColor = customTextColors().cyanColor;
  
    return TimePickerThemeData(
          helpTextStyle: helpTextStyle,
          backgroundColor: bgColor,
          hourMinuteColor: hoMiColor,
          hourMinuteTextColor: hoMiTextColor,
          dayPeriodColor: dpColor,
          dayPeriodTextColor: dpTextColor,
          dialBackgroundColor: dialBG,
          dialHandColor: dhColor,
          dialTextColor: dtColor,
          entryModeIconColor: entryIconColor,
          dayPeriodTextStyle: dpTextStyle,
        );
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

    // headlineMediumn
    final double hmSize = 24.sp;
    final hmWeight = FontWeight.w800;
    final hmColor = customTextColors().brownColor;

    // headlineSmall
    final double hsSize = 16.sp;
    final  hsWeight = FontWeight.w800;
    final  hsColor = customTextColors().brown800Color;

    // titleSmall
    final tsSize = 16.sp;
    final tsColor = customTextColors().purpleColor;

    // bodySmall
    final bsSize = 12.sp;
    final bsWeight = FontWeight.w500;
    final bsColor = customTextColors().cyanColor;

    // titleMedium
    final tmColor = customTextColors().blackColor;
    final tmSize = 16.sp;

    // titleLarge = 
    final double tlSize = 13.sp;
    final tlColor = customTextColors().brownColor;
    final tlWeight = FontWeight.w600;
    final double tlLetSpac = 1.0;

    // labelMedium
    final lmSize = 10.sp;
    final lmWeight = FontWeight.w500;
    final lmColor = customTextColors().blackColor;

    return TextTheme(
          headlineMedium: TextStyle(
            fontSize: hmSize, 
            fontWeight: hmWeight, 
            color: hmColor),          
          headlineSmall: TextStyle(
            fontSize: hsSize, 
            fontWeight: hsWeight, 
            color: hsColor),          
          titleSmall: GoogleFonts.poppins(
            fontSize: tsSize, 
            color: tsColor),
          bodySmall: GoogleFonts.poppins(
            fontSize: bsSize,
            fontWeight: bsWeight,
            color: bsColor),
          titleMedium: GoogleFonts.poppins(
            color: tmColor,
            fontSize: tmSize),
          titleLarge: GoogleFonts.poppins(
            fontSize: tlSize, 
            color: tlColor, 
            fontWeight: tlWeight,
            letterSpacing: tlLetSpac),
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


