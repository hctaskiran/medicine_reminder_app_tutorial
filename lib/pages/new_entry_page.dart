import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';
import 'package:medicine_reminder_app_tutorial/components/entry_block.dart';
import 'package:medicine_reminder_app_tutorial/components/global_block.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../components/timeconvert.dart';
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
  late EntryBlock _entryBlock;
  // GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosController.dispose();
    _entryBlock.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosController = TextEditingController();
    _entryBlock = EntryBlock();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBlock globalBlock = Provider.of<GlobalBlock>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'New Medicine',
          style: TextStyle(color: customTextColors().greenColor),
        ),
      ),
      body: Provider<EntryBlock>.value(
        value: _entryBlock,
        child: Padding(
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
                child: StreamBuilder<MedicineType>(
                  stream: _entryBlock.chooseMedicineType,
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
                          name: 'Tablet', 
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
              const PanelTitle(
                title: 'Interval Selection', 
                isRequired: true),
      
              const InstervalSelection(),
      
              const PanelTitle(
                title: 'Starting Time',
                isRequired: true),
      
              const TimeSelector(),
      
              SizedBox(height: 1.h),
      
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: SizedBox(
                  width: 80.w,
                  height: 7.h,
                  child: TextButton(
                    onPressed: () {
                      
                    },
                    child: Center(
                      child: Text('Confirm',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: customScaffoldColor
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: customTextColors().cyanColor,
                      shape: const StadiumBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
class TimeSelector extends StatefulWidget {
  const TimeSelector({super.key});

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {

  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;

  Future<TimeOfDay> _timeSelect() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context, 
      initialTime: _time);

      if (picked != null && picked != _time) {
        setState(() {
          _time = picked;
          _clicked = true;

          // state update
        });
      }
      return picked!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: Padding(
        padding: EdgeInsets.only(top:2.h),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: customTextColors().cyanColor,
            shape: const StadiumBorder()
          ),
          onPressed: () {
            _timeSelect();
          },
          child: Center(
            child: Text(
              _clicked == false 
              ? 'Set Time' 
              : 
              '${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: customScaffoldColor
            ),
            ),
          ),
        ),
      ),
    );
  }
}
//
class InstervalSelection extends StatefulWidget {
  const InstervalSelection({super.key});

  @override
  State<InstervalSelection> createState() => _InstervalSelectionState();
}

class _InstervalSelectionState extends State<InstervalSelection> {
  final _intervals = [6, 8, 12, 24];
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Remind every',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: customTextColors().brownColor
          ),
          ),
          DropdownButton(
            iconEnabledColor: customTextColors().cyanColor,
            dropdownColor: customScaffoldColor,
            itemHeight: 8.h,
            hint: _selected == 0 ? Text(' Choose an Interval',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 12,
              color: customTextColors().cyanColor,
            )) : null,
            elevation: 4,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString(),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: customTextColors().orangeColor,
                  fontSize: 16
                ),
                ),
              );
            }).toList(),
            onChanged: (newVal){
              setState(() {
                _selected = newVal!;
              });
            },
          ),
          Text(_selected == 1 ? ' hour' : ' hours',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: customTextColors().brownColor
            ),
          ),
        ],
      ),
    );
  }
}
//
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
    final EntryBlock entryBlock = Provider.of<EntryBlock>(context);
    return GestureDetector(
      onTap: () {
        // select medicine
        entryBlock.updateSelectedMedicine(medicineType);
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
                    fontSize: 18,
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