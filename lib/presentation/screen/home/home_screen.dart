import 'package:appsche/Notify/notifier.dart';
import 'package:appsche/application/utils/extension/data_to_model.dart';
import 'package:appsche/data/local/driff/db/db_app.dart';
import 'package:appsche/data/local/driff/repo/task_repo.dart';
import 'package:appsche/domain/bloc/home/home_cubit.dart';
import 'package:appsche/presentation/navigation/routers.dart';
import 'package:appsche/rsc/color.dart';
import 'package:appsche/widget/button.dart';
import 'package:appsche/widget/task_title.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

import '../../../application/utils/format/format_date.dart';
import '../../../data/models/task.dart';
import '../../../main.dart';
import '../../../rsc/text_style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

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
                        state.timeNow,
                        style: s18f700ColorBlueMa,
                      ),
                    );
                  }),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routers.addTask);
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
                  },
                ),
              );
            }),
            BlocBuilder<HomeCubit, HomeState>(buildWhen: (pre, now) {
              return pre.timeNow != now.timeNow;
            }, builder: (context, state) {
              return Expanded(
                  child: StreamBuilder<List<TaskEntityData>>(
                stream: instance
                    .get<TaskLocalRepository>()
                    .getAllTaskByDay(state.timeNow.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Task task = snapshot.data![index].toGetTaskModel();
                          NotifyHelper().scheduledNotification(
                              int.parse(task.startTime.toString().split(":")[0]),
                              int.parse(task.startTime.toString().split(":")[1]),
                              task);
                          return SizedBox(
                              child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25)),
                                  ),
                                  builder: (_) {
                                    return SizedBox(
                                      height: size.height * 0.18,
                                      child:
                                          AnimationConfiguration.staggeredList(
                                              position: index,
                                              child: SlideAnimation(
                                                  child: Column(
                                                children: [
                                                  RoundedButton(
                                                      text: 'Complete Task',
                                                      press: () {
                                                        snapshot.data![index]
                                                            .copyWith(
                                                                isCompleted: 1);
                                                        instance
                                                            .get<
                                                                TaskLocalRepository>()
                                                            .updateTask(snapshot
                                                                .data![index]);
                                                        Navigator.pop(context);
                                                      },
                                                      color: colorMainBlue,
                                                      textColor:
                                                          colorSystemWhite,
                                                      size: size.width * 0.8),
                                                  RoundedButton(
                                                      text: 'Delete Task',
                                                      press: () {
                                                        instance
                                                            .get<
                                                                TaskLocalRepository>()
                                                            .deleteTask(snapshot
                                                                .data![index]
                                                                .id);
                                                        Navigator.pop(context);
                                                      },
                                                      color: colorErrorPrimary,
                                                      textColor:
                                                          colorSystemWhite,
                                                      size: size.width * 0.8),
                                                  RoundedButton(
                                                      text: 'Close',
                                                      press: () {
                                                        Navigator.pop(context);
                                                      },
                                                      color: colorGreyTetiary,
                                                      textColor:
                                                          colorSystemWhite,
                                                      size: size.width * 0.8),
                                                ],
                                              ))),
                                    );
                                  });
                            },
                            child: TaskTile(
                                snapshot.data![index].toGetTaskModel()),
                          ));
                        });
                  } else {
                    return const Center(
                      child: Text(
                        'NOTHING ADDED !!',
                        style: s20f700ColorMBlue,
                      ),
                    );
                  }
                },
              ));
            }),
          ],
        ),
      ),
    );
  }
}
