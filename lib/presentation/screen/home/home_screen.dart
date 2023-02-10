import 'package:appsche/Notify/notifier.dart';
import 'package:appsche/domain/bloc/home/home_cubit.dart';
import 'package:appsche/presentation/navigation/routers.dart';
import 'package:appsche/rsc/color.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../rsc/text_style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final f = DateFormat('MMMM dd yyyy');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.04,
            left: size.width * 0.05,
            right: size.width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<HomeCubit, HomeState>(
                      buildWhen: (previousState, state) {
                    return previousState.timeNow != state.timeNow;
                  }, builder: (context, state) {
                    return SizedBox(
                      child: Text(
                        f.format(state.timeNow),
                        style: s18f700ColorBlueMa,
                      ),
                    );
                  }),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context,Routers.addTask );
                    },
                    child: Container(
                      height: size.height * 0.06,
                      decoration: const BoxDecoration(
                          color: colorMainBlue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      alignment: Alignment.centerRight,
                      width: size.width * 0.3,
                      child: const Center(
                          child: Text(
                        '+ Add Task',
                        style: s14f700ColorWhiteSys,
                      )),
                    ),
                  )
                ],
              ),
            ),
            BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              return Container(
                child: DatePicker(
                  DateTime.now(),
                  height: size.height * 0.15,
                  width: size.width * 0.115,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: colorMainBlue,
                  onDateChange: (date) {
                    context.read<HomeCubit>().dateChanged(date);
                    NotifyHelper().displayNotification(title: "Scheduled  Daily", body: "This is show Scheduled Daily");
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
