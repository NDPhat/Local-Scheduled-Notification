import 'package:appsche/application/enum/ask_task_enum.dart';
import 'package:appsche/domain/bloc/add_task/add_task_cubit.dart';
import 'package:appsche/presentation/navigation/routers.dart';
import 'package:appsche/widget/box_field.dart';
import 'package:appsche/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../../application/utils/extension/compare_timeofDay.dart';
import '../../../application/utils/format/format_date.dart';
import '../../../rsc/color.dart';
import '../../../rsc/text_style.dart';
import '../../../widget/button.dart';
import '../../../widget/date_picker.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);
  final f = DateFormat('MM/dd/yyyy');
  final l = DateFormat('hh:mm aa');
  String startTime = DateFormat('hh:mm aa').format(DateTime.now());
  final listRemind = [
    "5 minutes early",
    "10 minutes early",
    "15 minutes early",
    "20 minutes early",
    "25 minutes early",
    "30 minutes early",
  ];
  final listRepeat = [
    "None",
    "Repeat 1 hour",
    "Repeat 2 hour",
    "Repeat Daily",
    "Repeat Monthly",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: size.width * 0.15),
          child: const Text('Add your task'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.04,
            left: size.width * 0.05,
            right: size.width * 0.05),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<AddTaskCubit, AddTaskState>(buildWhen: (pre, now) {
                  return pre.titleMess != now.titleMess;
                }, builder: (context, state) {
                  return Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.02,
                      ),
                      child: InputField(
                        hintText: 'Enter title here ',
                        nameTitle: 'Title',
                        isHidden: state.titleMess != "",
                        validateText: state.titleMess,
                        hasError: state.titleMess != "",
                        onChanged: (value) {
                          context.read<AddTaskCubit>().titleChanged(value);
                        },
                        size: size.width,
                      ));
                }),
                BlocBuilder<AddTaskCubit, AddTaskState>(buildWhen: (pre, now) {
                  return pre.noteMess != now.noteMess;
                }, builder: (context, state) {
                  return Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.02,
                      ),
                      child: InputField(
                        hintText: 'Enter note here ',
                        validateText: state.noteMess,
                        hasError: state.noteMess != "",
                        isHidden: state.noteMess != "",
                        onChanged: (value) {
                          context.read<AddTaskCubit>().noteChanged(value);
                        },
                        nameTitle: 'Note',
                        size: size.width,
                      ));
                }),
                BlocBuilder<AddTaskCubit, AddTaskState>(buildWhen: (pre, now) {
                  return pre.dateSaveTask != now.dateSaveTask;
                }, builder: (context, state) {
                  return Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.02,
                      ),
                      child: BoxField(
                          hintText: state.dateSaveTask,
                          nameTitle: 'Date',
                          size: size.width,
                          icon: const Icon(Icons.calendar_month),
                          onTapped: () => showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25)),
                              ),
                              builder: (_) {
                                return Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width * 0.05,
                                      right: size.width * 0.05,
                                    ),
                                    child: SizedBox(
                                      height: size.height * 0.3,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.23,
                                            child: MyScrollDatePicker(
                                                scrollViewOptions:
                                                    const DatePickerScrollViewOptions(
                                                  year: ScrollViewDetailOptions(
                                                      margin:
                                                          EdgeInsets.all(10)),
                                                  month:
                                                      ScrollViewDetailOptions(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10)),
                                                  day: ScrollViewDetailOptions(
                                                      margin:
                                                          EdgeInsets.all(10)),
                                                ),
                                                maximumDate: DateTime.now().add(
                                                    const Duration(days: 30)),
                                                selectedDate: DateTime.now(),
                                                locale: const Locale('en'),
                                                onDateTimeChanged:
                                                    (DateTime value) {
                                                  context
                                                      .read<AddTaskCubit>()
                                                      .dateTimeChange(
                                                          formatDateInput
                                                              .format(value));
                                                }),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RoundedButton(
                                                  text: "Cancel",
                                                  press: () {
                                                    Navigator.pop(context);
                                                  },
                                                  color: colorSystemWhite,
                                                  textColor: colorMainBlue,
                                                  size: size.width * 0.4),
                                              RoundedButton(
                                                  text: 'Done',
                                                  press: () {
                                                    context
                                                        .read<AddTaskCubit>()
                                                        .emitDateTimeChange(
                                                            state.dateSaveTask);
                                                    Navigator.pop(context);
                                                  },
                                                  color: colorMainBlue,
                                                  textColor: colorSystemWhite,
                                                  size: size.width * 0.4)
                                            ],
                                          )
                                        ],
                                      ),
                                    ));
                              })));
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<AddTaskCubit, AddTaskState>(
                        buildWhen: (pre, now) {
                      return pre.timeStart != now.timeStart;
                    }, builder: (context, state) {
                      return Padding(
                          padding: EdgeInsets.only(
                            bottom: size.height * 0.02,
                          ),
                          child: BoxField(
                              hintText: state.timeStart,
                              nameTitle: 'Start time',
                              size: size.width * 0.42,
                              icon: const Icon(Icons.timer),
                              onTapped: () async {
                                var timePic = await showTimePicker(
                                    initialEntryMode:
                                        TimePickerEntryMode.inputOnly,
                                    context: context,
                                    initialTime: TimeOfDay(
                                        hour: int.parse(
                                            state.timeStart.split(":")[0]),
                                        minute: int.parse(state.timeStart
                                            .split(":")[1]
                                            .split(" ")[0])));
                                context
                                    .read<AddTaskCubit>()
                                    .emitStartTimeChange((timePic ??
                                            TimeOfDay(
                                                hour: DateTime.now().hour,
                                                minute: DateTime.now().minute))
                                        .format(context));
                              }));
                    }),
                    BlocBuilder<AddTaskCubit, AddTaskState>(
                        buildWhen: (pre, now) {
                      return pre.timeEnd != now.timeEnd;
                    }, builder: (context, state) {
                      return Padding(
                          padding: EdgeInsets.only(
                            bottom: size.height * 0.02,
                          ),
                          child: BoxField(
                              hintText: state.timeEnd,
                              nameTitle: 'End time',
                              size: size.width * 0.42,
                              icon: const Icon(Icons.timer),
                              onTapped: () async {
                                var timePic = await showTimePicker(
                                    initialEntryMode:
                                        TimePickerEntryMode.inputOnly,
                                    context: context,
                                    initialTime: TimeOfDay(
                                        hour: int.parse(
                                            state.timeEnd.split(":")[0]),
                                        minute: int.parse(state.timeEnd
                                            .split(":")[1]
                                            .split(" ")[0])));
                                //compare timeEnd va timeStart
                                if (convertTimeDayToDouble(timePic ??
                                        TimeOfDay(
                                            hour: DateTime.now().hour,
                                            minute: DateTime.now().minute)) <
                                    convertTimeDayToDouble(
                                        convertToTimeOfDay(state.timeStart))) {
                                  AlertDialog(
                                    content: const Text(
                                      "EndTime must be greater than StartTime !!",
                                      textAlign: TextAlign.center,
                                      style: s20f700ColorErrorPro,
                                    ),
                                    actions: <Widget>[
                                      RoundedButton(
                                          text: 'Back',
                                          press: () {
                                            Navigator.pop(context);
                                          },
                                          color: colorMainBlue,
                                          textColor: colorSystemWhite,
                                          size: size.width)
                                    ],
                                  );
                                  context
                                      .read<AddTaskCubit>()
                                      .emitEndTimeChange((TimeOfDay(
                                              hour: DateTime.now().hour,
                                              minute: DateTime.now().minute+10))
                                          .format(context));
                                } else {
                                  context
                                      .read<AddTaskCubit>()
                                      .emitEndTimeChange((timePic ??
                                              TimeOfDay(
                                                  hour: DateTime.now().hour,
                                                  minute:
                                                      DateTime.now().minute))
                                          .format(context));
                                }
                              }));
                    }),
                  ],
                ),
                BlocBuilder<AddTaskCubit, AddTaskState>(buildWhen: (pre, now) {
                  return pre.remind != now.remind;
                }, builder: (context, state) {
                  return Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.02,
                      ),
                      child: BoxField(
                          hintText: state.remind,
                          nameTitle: 'Remind',
                          size: size.width,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          onTapped: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25)),
                                ),
                                builder: (_) {
                                  return Container(
                                      height: size.height * 0.55,
                                      child: BlocProvider.value(
                                          value: BlocProvider.of<AddTaskCubit>(
                                              context),
                                          child: DropDownRemind(
                                            listData: listRemind,
                                            size: size,
                                          )));
                                });
                          }));
                }),
                BlocBuilder<AddTaskCubit, AddTaskState>(buildWhen: (pre, now) {
                  return pre.repeat != now.repeat;
                }, builder: (context, state) {
                  return Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.02,
                      ),
                      child: BoxField(
                          hintText: state.repeat,
                          nameTitle: 'Repeat',
                          size: size.width,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          onTapped: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25)),
                                ),
                                builder: (_) {
                                  return Container(
                                      height: size.height * 0.3,
                                      child: BlocProvider.value(
                                          value: BlocProvider.of<AddTaskCubit>(
                                              context),
                                          child: DropDownRepeat(
                                            listData: listRepeat,
                                            size: size,
                                          )));
                                });
                          }));
                }),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: size.height * 0.02,
                  ),
                  child: SizedBox(
                    width: size.width,
                    child: const Text(
                      'Color',
                      style: s15f700ColorBlueMa,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<AddTaskCubit, AddTaskState>(
                                builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<AddTaskCubit>()
                                      .colorChange("blue");
                                },
                                child: CircleAvatar(
                                    backgroundColor: colorMainBlue,
                                    radius: 15,
                                    child: state.color == "blue"
                                        ? const Icon(
                                            (Icons.done),
                                            color: colorSystemWhite,
                                            size: 16,
                                          )
                                        : Container()),
                              );
                            }),
                            BlocBuilder<AddTaskCubit, AddTaskState>(
                                buildWhen: (pre, now) {
                              return pre.color != now.color;
                            }, builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<AddTaskCubit>()
                                      .colorChange("yellow");
                                },
                                child: CircleAvatar(
                                    backgroundColor: colorSystemYeloow,
                                    radius: 15,
                                    child: state.color == "yellow"
                                        ? const Icon(
                                            (Icons.done),
                                            color: colorSystemWhite,
                                            size: 16,
                                          )
                                        : Container()),
                              );
                            }),
                            BlocBuilder<AddTaskCubit, AddTaskState>(
                                builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<AddTaskCubit>()
                                      .colorChange("red");
                                },
                                child: CircleAvatar(
                                    backgroundColor: colorErrorPrimary,
                                    radius: 15,
                                    child: state.color == "red"
                                        ? const Icon(
                                            (Icons.done),
                                            color: colorSystemWhite,
                                            size: 16,
                                          )
                                        : Container()),
                              );
                            }),
                          ],
                        ),
                      ),
                      BlocListener<AddTaskCubit, AddTaskState>(
                          listener: (context, state) {
                            if (state.status == AddTaskStatus.error) {
                              showDialog(
                                context: context,
                                builder: (ctx) => Center(
                                  child: AlertDialog(
                                    content: const Text(
                                      "ERROR FORM !!",
                                      textAlign: TextAlign.center,
                                      style: s20f700ColorErrorPro,
                                    ),
                                    actions: <Widget>[
                                      RoundedButton(
                                          text: 'Back',
                                          press: () {
                                            Navigator.pop(context);
                                          },
                                          color: colorMainBlue,
                                          textColor: colorSystemWhite,
                                          size: size.width)
                                    ],
                                  ),
                                ),
                              );
                              context
                                  .read<AddTaskCubit>()
                                  .clearOldDataErrorForm();
                            } else if (state.status == AddTaskStatus.success) {
                              showDialog(
                                context: context,
                                builder: (ctx) => Center(
                                  child: AlertDialog(
                                    content: const Text(
                                      "ADD DONE !!",
                                      textAlign: TextAlign.center,
                                      style: s20f700ColorMBlue,
                                    ),
                                    actions: <Widget>[
                                      RoundedButton(
                                          text: 'Done',
                                          press: () {
                                            Navigator.pushNamed(
                                                context, Routers.home);
                                          },
                                          color: colorMainBlue,
                                          textColor: colorSystemWhite,
                                          size: size.width)
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                          child: RoundedButton(
                              text: "Add",
                              press: () {
                                context.read<AddTaskCubit>().saveTaskToLocal();
                              },
                              color: colorMainBlue,
                              textColor: colorSystemWhite,
                              size: size.width * 0.3))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownRemind extends StatelessWidget {
  const DropDownRemind({
    Key? key,
    required this.listData,
    required this.size,
  }) : super(key: key);

  final List<String> listData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: size.height * 0.5,
        child: ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.02,
                      left: size.width * 0.05,
                      right: size.width * 0.05),
                  child: BlocBuilder<AddTaskCubit, AddTaskState>(
                      buildWhen: (pre, now) {
                    return pre.indexRemind != now.indexRemind;
                  }, builder: (contextBL, state) {
                    return ListTile(
                        onTap: () {
                          contextBL.read<AddTaskCubit>().remindChange(index);
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              listData[index],
                              style: s16f500ColorGreyTe,
                            ),
                            Visibility(
                                visible: index == state.indexRemind,
                                child: const Icon(
                                  Icons.check,
                                  color: colorMainTealPri,
                                ))
                          ],
                        ));
                  }));
            }),
      ),
      BlocBuilder<AddTaskCubit, AddTaskState>(builder: (contextBL, state) {
        return SizedBox(
          height: size.height * 0.05,
          child: RoundedButton(
              text: 'Select',
              press: () {
                contextBL
                    .read<AddTaskCubit>()
                    .remindSelected(listData[state.indexRemind]);
                Navigator.pop(context);
              },
              color: colorMainBlue,
              textColor: colorSystemWhite,
              size: size.width * 0.9),
        );
      })
    ]);
  }
}

class DropDownRepeat extends StatelessWidget {
  const DropDownRepeat({
    Key? key,
    required this.listData,
    required this.size,
  }) : super(key: key);

  final List<String> listData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: size.height * 0.25,
        child: ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.02,
                      left: size.width * 0.05,
                      right: size.width * 0.05),
                  child: BlocBuilder<AddTaskCubit, AddTaskState>(
                      buildWhen: (pre, now) {
                    return pre.indexRepeat != now.indexRepeat;
                  }, builder: (contextBL, state) {
                    return ListTile(
                        onTap: () {
                          contextBL.read<AddTaskCubit>().repeatChange(index);
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              listData[index],
                              style: s16f500ColorGreyTe,
                            ),
                            Visibility(
                                visible: index == state.indexRepeat,
                                child: const Icon(
                                  Icons.check,
                                  color: colorMainTealPri,
                                ))
                          ],
                        ));
                  }));
            }),
      ),
      BlocBuilder<AddTaskCubit, AddTaskState>(builder: (contextBL, state) {
        return SizedBox(
          height: size.height * 0.05,
          child: RoundedButton(
              text: 'Select',
              press: () {
                contextBL
                    .read<AddTaskCubit>()
                    .repeatSelected(listData[state.indexRepeat]);
                Navigator.pop(context);
              },
              color: colorMainBlue,
              textColor: colorSystemWhite,
              size: size.width * 0.9),
        );
      })
    ]);
  }
}
