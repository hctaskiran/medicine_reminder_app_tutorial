import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';


class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 2200), () {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: customTextColors().whiteColor,
      child: Center(
        child: Image.asset(
          'assets/icons/check.png', 
          alignment: Alignment.center,
          fit: BoxFit.contain,
          ),
      ),
      
    );
  }
}