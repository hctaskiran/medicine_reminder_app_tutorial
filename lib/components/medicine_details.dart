import 'package:flutter/material.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/medicine.dart';
import 'global_block.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails(this.medicine, {super.key});
  final Medicine medicine;

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {

  @override
  Widget build(BuildContext context) {
    final GlobalBlock _globalBlock = Provider.of<GlobalBlock>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            MainSection(medicine: widget.medicine),
            ExtendedSection(medicine: widget.medicine),
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
                  openAlertBox(context, _globalBlock);
                }, 
                child: Text('Delete',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: customTextColors().whiteColor
                ),
                )
              ),
            ),
            SizedBox(height: 2.h,)
          ],
        ),
      ),
    );
  }



  openAlertBox(BuildContext context, GlobalBlock _globalBlock){
    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: customScaffoldColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)
            )
          ),
          contentPadding: EdgeInsets.only(top: 1.h),
          title: Text('Delete reminder?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text(
                'No',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: customTextColors().cyanColor
                ),
              )
            ),
            TextButton(
              onPressed: (){
                _globalBlock.removeMedicine(widget.medicine);
                Navigator.popUntil(context, ModalRoute.withName('/'));
              }, 
              child: Text(
                'Yes',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: customTextColors().redColor
                )
              ),
            ),            
          ],
        );
      }
    );
  }
}

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({super.key, this.medicine});
  final Medicine? medicine;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children:  [
        ExtendedInfoTab(
          fieldTitle: 'Medicine Type', 
          fieldInfo: medicine!.medicineType! == 'None' ? 'Not Specified' : medicine!.medicineType!),
        ExtendedInfoTab(
          fieldTitle: 'Dose Interval', 
          fieldInfo: 'Every ${medicine!.interval} hours | ${medicine!.interval == 24 ? 'Once in a day' 
          : '${(24 / medicine!.interval!).floor()}'} times in a day'),
        ExtendedInfoTab(
          fieldTitle: 'Start Time', 
          fieldInfo: '${medicine!.startTime![0]}${medicine!.startTime![1]}:${medicine!.startTime![2]}${medicine!.startTime![3]}'),
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
    super.key, this.medicine,
  });

  final Medicine? medicine;

  Hero makeIcon(double size) {
    if (medicine!.medicineType == 'Pill') {
      return Hero(
          tag: medicine!.medicineName! + medicine!.medicineType!,
          child: Image.asset(
            'assets/icons/pill.png',
            color: customTextColors().cyanColor,
            height: 7.h,
          ));
    } else if (medicine!.medicineType == 'Syrup') {
      return Hero(
          tag: medicine!.medicineName! + medicine!.medicineType!,
          child: Image.asset(
            'assets/icons/bottle.png',
            color: customTextColors().cyanColor,
            height: 7.h,
          ));
    } else if (medicine!.medicineType == 'Tablet') {
      return Hero(
          tag: medicine!.medicineName! + medicine!.medicineType!,
          child: Image.asset(
            'assets/icons/tablet.png',
            color: customTextColors().cyanColor,
            height: 7.h,
          ));
    } else if (medicine!.medicineType == 'Syringe') {
      return Hero(
          tag: medicine!.medicineName! + medicine!.medicineType!,
          child: Image.asset(
            'assets/icons/syringe.png',
            color: customTextColors().cyanColor,
            height: 7.h,
          ));
    }
    return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: Icon(
          Icons.error,
          color: customTextColors().cyanColor,
          size: size,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        makeIcon(7.h),
        SizedBox(width: 2.w),
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: medicine!.medicineName!, 
              child: MainInfoTab(
                fieldTitle: 'Medicine Name', 
                fieldInfo: medicine!.medicineName!)),
            MainInfoTab(
              fieldTitle: 'Dosage (MG)', 
              fieldInfo: medicine!.dosage == 0 ? 'Dosage not specified.' : '${medicine!.dosage} (MG)'),
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
