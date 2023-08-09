import 'package:flutter/material.dart';
import 'package:medicine_reminder_app_tutorial/components/medicine_details.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
              highlightColor: customTextColors().whiteColor,
              splashColor: customTextColors().grey500color,
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineDetails()));
              },
              child: Container(
                padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h, bottom: 2.h),
                margin: EdgeInsets.all(1.h),
                width: 20.w,
                height: 20.h,              
                decoration: BoxDecoration(
                  color: customTextColors().whiteColor,
                  borderRadius: BorderRadius.circular(2.h)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Image.asset(
                      'assets/icons/pill.png', 
                      color: customTextColors().cyanColor,
                      height: 7.h,
                    ),                  
                    const Spacer(),
                    Text(
                      'Pill',
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleLarge),
                    
                    SizedBox(height: 0.3.h),
            
                    Text(
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.start,
                      'Every 8 hours',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: customTextColors().grey500color
                      )),
                  ],
                ),
              ),
            );
  }
}