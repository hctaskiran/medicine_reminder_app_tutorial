import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';
import 'package:sizer/sizer.dart';

import '../models/medicine_type.dart';

class NewEntry extends StatefulWidget {
  const NewEntry({super.key});

  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  late TextEditingController nameController;
  late TextEditingController dosController;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  // GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosController.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosController = TextEditingController();

    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'New Medicine',
          style: TextStyle(color: customTextColors().greenColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PanelTitle(
              title: 'Medicine Name', 
              isRequired: true),
            TextFormField(
              // key: _formKey,
              // autovalidateMode: AutovalidateMode.always,
              // validator: FormFieldValidator().isNotEmpty,
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              maxLength: 12,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: customTextColors().brownColor),
            ),
            const PanelTitle(
              title: 'Dosage in MG', 
              isRequired: false),
            TextFormField(
              controller: dosController,
              keyboardType: TextInputType.number,
              maxLength: 12,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: customTextColors().brownColor),
            ),
            SizedBox(height: 2.h),
            const PanelTitle(
              title: 'Type of Medicine', 
              isRequired: false),
            Padding(
              padding:  EdgeInsets.only(top: 1.h),
              child: StreamBuilder(
                builder:(context, snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MedicineColumn(
                        name: 'Pill', 
                        iconValue: 'assets/icons/pill.png', 
                        isSelected: snapshot.data == MedicineType.pill ? true : false, 
                        medicineType: MedicineType.pill),
            
                        MedicineColumn(
                        name: 'Syrup', 
                        iconValue: 'assets/icons/bottle.png', 
                        isSelected: snapshot.data == MedicineType.syrup ? true : false, 
                        medicineType: MedicineType.syrup),
            
            
                        MedicineColumn(
                        name: 'Tablets', 
                        iconValue: 'assets/icons/tablet.png', 
                        isSelected: snapshot.data == MedicineType.tablet ? true : false, 
                        medicineType: MedicineType.tablet),
                
                        MedicineColumn(
                        name: 'Syringe', 
                        iconValue: 'assets/icons/syringe.png', 
                        isSelected: snapshot.data == MedicineType.syringe ? true : false, 
                        medicineType: MedicineType.syringe),
                  ],
                );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicineColumn extends StatelessWidget {
  const MedicineColumn({
    super.key, 
    required this.name, 
    required this.iconValue, 
    required this.isSelected, 
    required this.medicineType});
  
  final MedicineType medicineType;
  final String name;
  final String iconValue;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // select medicine
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 20.w,
            height: 10.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.h),
              color: isSelected ? customTextColors().cyanColor : customTextColors().whiteColor,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 1.h,
                  bottom: 1.h,
                ),
                child: Image.asset(
                  iconValue,
                  height: 7.h, 
                  color: isSelected ? customTextColors().whiteColor : customTextColors().cyanColor),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Container(
              width: 20.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: isSelected ? customTextColors().cyanColor : customTextColors().transparent, 
                borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: isSelected ? customTextColors().whiteColor : customTextColors().cyanColor
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PanelTitle extends StatelessWidget {
  const PanelTitle({super.key, required this.title, required this.isRequired});
  final String title;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Text.rich(
        TextSpan(children: <TextSpan>[
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          TextSpan(
              text: isRequired ? '*' : '',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(color: customTextColors().blackColor)),
        ]),
      ),
    );
  }
}

// class FormFieldValidator {
//   String? isNotEmpty(String? data) {
//     return (data?.isNotEmpty ?? false) ? null : ValidatorMessage.notEmpty;
//   }
// }

// class ValidatorMessage {
//   static const String notEmpty = 'This area cannot be empty.';
// }