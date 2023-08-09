import 'package:flutter/material.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';
import 'package:sizer/sizer.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails({super.key});

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            MainSection(),
            ExtendedSection(),
            Spacer(),
            SizedBox(
              width: 100.w,
              height: 7.h,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: customTextColors().orangeColor,
                  shape: const StadiumBorder()
                ),
                onPressed: () {
                  
                }, 
                child: Text('Delete',
                style: Theme.of(context).textTheme.titleMedium,
                )
              ),
            ),
            SizedBox(height: 2.h,)
          ],
        ),
      ),
    );
  }
}

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: const [
        ExtendedInfoTab(fieldTitle: 'Medicine Type', fieldInfo: 'Pill'),
        ExtendedInfoTab(fieldTitle: 'Dose Interval', fieldInfo: 'Every 8 hours | 3 times in a day'),
        ExtendedInfoTab(fieldTitle: 'Start Time', fieldInfo: '03.01'),
      ],
    );
  }
}

///////

class ExtendedInfoTab extends StatelessWidget {
  const ExtendedInfoTab({
    super.key,
    required this.fieldTitle,
    required this.fieldInfo,
  });

  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Text(fieldTitle,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: customTextColors().brown800Color)),
          ),
          Text(fieldInfo,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: customTextColors().orangeColor)),
        ],
      ),
    );
  }
}

///////

class MainSection extends StatelessWidget {
  const MainSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/icons/pill.png',
          height: 7.h,
          color: customTextColors().cyanColor,
        ),
        SizedBox(width: 2.w),
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            MainInfoTab(fieldTitle: 'Medicine Name', fieldInfo: 'Apranax'),
            MainInfoTab(fieldTitle: 'Dosage (MG)', fieldInfo: '500'),
          ],
        ),
      ],
    );
  }
}

///////

class MainInfoTab extends StatelessWidget {
  const MainInfoTab({super.key, required this.fieldTitle, required this.fieldInfo});
  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 18.w,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldTitle,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: customTextColors().grey600color),
            ),
            SizedBox(height: 0.3.h),
            Text(
              fieldInfo,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
