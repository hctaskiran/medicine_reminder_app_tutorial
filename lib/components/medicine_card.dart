import 'package:flutter/material.dart';
import 'package:medicine_reminder_app_tutorial/components/medicine_details.dart';
import 'package:sizer/sizer.dart';

import '../models/medicine.dart';
import 'colors.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key, required this.medicine});
  final Medicine medicine;
  final transDuration = const Duration(milliseconds: 500);

  Hero makeIcon(double size) {
    if (medicine.medicineType == 'Pill') {
      return Hero(
          tag: medicine.medicineName! + medicine.medicineType!,
          child: Image.asset(
            'assets/icons/pill.png',
            color: customTextColors().cyanColor,
            height: 7.h,
          ));
    } else if (medicine.medicineType == 'Syrup') {
      return Hero(
          tag: medicine.medicineName! + medicine.medicineType!,
          child: Image.asset(
            'assets/icons/bottle.png',
            color: customTextColors().cyanColor,
            height: 7.h,
          ));
    } else if (medicine.medicineType == 'Tablet') {
      return Hero(
          tag: medicine.medicineName! + medicine.medicineType!,
          child: Image.asset(
            'assets/icons/tablet.png',
            color: customTextColors().cyanColor,
            height: 7.h,
          ));
    } else if (medicine.medicineType == 'Syringe') {
      return Hero(
          tag: medicine.medicineName! + medicine.medicineType!,
          child: Image.asset(
            'assets/icons/syringe.png',
            color: customTextColors().cyanColor,
            height: 7.h,
          ));
    }
    return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: Icon(
          Icons.error,
          color: customTextColors().cyanColor,
          size: size,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: customTextColors().whiteColor,
      splashColor: customTextColors().grey500color,
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder<void>(
            pageBuilder: (BuildContext context, 
            Animation<double> animation, 
            Animation<double> secondaryAnimation) {
          return AnimatedBuilder(
              animation: animation,
              builder: (context, Widget? child) {
                return Opacity(
                  opacity: animation.value, 
                  child: MedicineDetails(medicine));
              }
            );
        },
        transitionDuration: transDuration
        ));
      },
      child: Container(
        padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h, bottom: 2.h),
        margin: EdgeInsets.all(1.h),
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(color: customTextColors().whiteColor, borderRadius: BorderRadius.circular(2.h)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            makeIcon(7.h),
            const Spacer(),
            Hero(
              tag: medicine.medicineName!,
              child: Text(
                medicine.medicineName!,
                overflow: TextOverflow.fade, 
                textAlign: TextAlign.start, 
                style: Theme.of(context).textTheme.titleLarge),
            ),
            SizedBox(height: 0.3.h),
            Text(
                overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
                medicine.interval == 1 ? 'Every ${medicine.interval} hours' : 'Every ${medicine.interval} hours',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: customTextColors().grey500color)),
          ],
        ),
      ),
    );
  }
}
