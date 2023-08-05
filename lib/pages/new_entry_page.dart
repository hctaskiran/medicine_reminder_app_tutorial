import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';
import 'package:sizer/sizer.dart';

class NewEntry extends StatefulWidget {
  const NewEntry({super.key});

  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  late TextEditingController nameController;
  late TextEditingController dosController;
  late GlobalKey<ScaffoldState> _scaffoldKey; 

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
        title: Text('New Medicine', 
        style: TextStyle(
          color: customTextColors().greenColor),),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PanelTitle(
              title: 'Medicine Name', 
              isRequired: true
            ),
            TextFormField(
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              maxLength: 12,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: customTextColors().brownColor
              ),
            ),
            const PanelTitle(
              title: 'Dosage in MG', 
              isRequired: false
            ),
            TextFormField(         
              controller: dosController,  
              keyboardType: TextInputType.number, 
              maxLength: 12,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: customTextColors().brownColor
              ),
            ),
            SizedBox(height: 2.h),
            const PanelTitle(title: 'Type of Medicine', isRequired: false),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 20.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.h),
                        color: customTextColors().cyanColor,
                      ),
                      child: Image.asset('assets/icons/pill.png'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
            text: isRequired? '*' : '',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: customTextColors().blackColor
            )
          ),
        ]),
      ),
    );
  }
}
