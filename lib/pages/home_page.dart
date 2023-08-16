import 'package:flutter/material.dart';
import 'package:medicine_reminder_app_tutorial/components/colors.dart';
import 'package:medicine_reminder_app_tutorial/components/custom_texts.dart';
import 'package:medicine_reminder_app_tutorial/components/global_block.dart';
import 'package:medicine_reminder_app_tutorial/components/medicine_card.dart';
import 'package:medicine_reminder_app_tutorial/models/medicine.dart';
import 'package:medicine_reminder_app_tutorial/pages/new_entry_page.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            FirstContainer(),
            SizedBox(height: 2.h),
            const Flexible(child: SecondContainer()),
          ],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const NewEntry()),
            ),
          );
        },
        child: SizedBox(
          width: 18.w,
          child: Card(
            color: customTextColors().greenColor,
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3.h)),
            child: Icon(
              Icons.add,
              color: customPrimaryColor,
              size: 50.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class FirstContainer extends StatelessWidget {
  FirstContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalBlock globalBlock = Provider.of<GlobalBlock>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // TOP CONTAINER
        //
        DwbhText(),
        WelcomeText(),
        SizedBox(
          height: 2.h,
        ),

        StreamBuilder<List<Medicine>>(
            stream: globalBlock.medicineList$,
            builder: (context, snapshot) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  bottom: 1.h,
                ),
                child: Text(!snapshot.hasData ? '0' : snapshot.data!.length.toString(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: customTextColors().pinkColor)),
              );
            }),
      ],
    );
  }
}

class SecondContainer extends StatelessWidget {
  const SecondContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalBlock globalBlock = Provider.of<GlobalBlock>(context);

    return StreamBuilder(
        stream: globalBlock.medicineList$,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'You haven\'t saved any medicine yet.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          } else {
            return GridView.builder(
              padding: EdgeInsets.only(top: 1.h),
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return MedicineCard(
                  medicine: snapshot.data![index]
                );
              },
            );
          }
        });
  }
}
