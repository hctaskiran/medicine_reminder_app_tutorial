import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';


class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
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