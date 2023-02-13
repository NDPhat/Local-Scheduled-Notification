import 'package:appsche/application/enum/ask_task_enum.dart';
import 'package:appsche/domain/bloc/add_task/add_task_cubit.dart';
import 'package:appsche/presentation/navigation/routers.dart';
import 'package:appsche/widget/box_field.dart';
import 'package:appsche/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../../application/utils/extension/compare_timeofDay.dart';
import '../../../application/utils/format/format_date.dart';
import '../../../data/models/task.dart';
import '../../../rsc/color.dart';
import '../../../rsc/text_style.dart';
import '../../../widget/button.dart';
import '../../../widget/date_picker.dart';

class DetailTask extends StatelessWidget {
  DetailTask({Key? key}) : super(key: key);
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
    "Repeat Daily",
    "Repeat Monthly",
  ];
  @override
  Widget build(BuildContext context) {
    final taskEdit = ModalRoute.of(context)!.settings.arguments as Task;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: size.width * 0.15),
            child: const Text('Detail task'),
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
                  Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.02,
                      ),
                      child: InputField(
                        readOnly: true,
                        controller: TextEditingController(
                            text: taskEdit.title.toString()),
                        hintText: 'Enter title here ',
                        nameTitle: 'Title',
                        size: size.width,
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.02,
                      ),
                      child: InputField(
                        controller: TextEditingController(
                            text: taskEdit.note.toString()),
                        hintText: 'Enter note here ',
                        readOnly: true,
                        nameTitle: 'Note',
                        size: size.width,
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.02,
                      ),
                      child: BoxField(
                          hintText: taskEdit.date.toString(),
                          nameTitle: 'Date',
                          size: size.width,
                          icon: const Icon(Icons.calendar_month),
                          onTapped: () {})),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                            bottom: size.height * 0.02,
                          ),
                          child: BoxField(
                              hintText: taskEdit.startTime.toString(),
                              nameTitle: 'Start time',
                              size: size.width * 0.42,
                              icon: const Icon(Icons.timer),
                              onTapped: () async {})),
                      Padding(
                          padding: EdgeInsets.only(
                            bottom: size.height * 0.02,
                          ),
                          child: BoxField(
                              hintText: taskEdit.endTime!,
                              nameTitle: 'End time',
                              size: size.width * 0.42,
                              icon: const Icon(Icons.timer),
                              onTapped: () async {
                                //compare timeEnd va timeStar
                              })),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.02,
                      ),
                      child: BoxField(
                          hintText: taskEdit.remind.toString(),
                          nameTitle: 'Remind',
                          size: size.width,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          onTapped: () {})),
                  Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.02,
                      ),
                      child: BoxField(
                          hintText: taskEdit.repeat.toString(),
                          nameTitle: 'Repeat',
                          size: size.width,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          onTapped: () {})),
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
                              CircleAvatar(
                                  backgroundColor: colorMainBlue,
                                  radius: 15,
                                  child: taskEdit.color == "blue"
                                      ? const Icon(
                                          (Icons.done),
                                          color: colorSystemWhite,
                                          size: 16,
                                        )
                                      : Container()),
                              CircleAvatar(
                                  backgroundColor: colorSystemYeloow,
                                  radius: 15,
                                  child: taskEdit.color == "yellow"
                                      ? const Icon(
                                          (Icons.done),
                                          color: colorSystemWhite,
                                          size: 16,
                                        )
                                      : Container()),
                              CircleAvatar(
                                  backgroundColor: colorErrorPrimary,
                                  radius: 15,
                                  child: taskEdit.color == "red"
                                      ? const Icon(
                                          (Icons.done),
                                          color: colorSystemWhite,
                                          size: 16,
                                        )
                                      : Container()),
                            ],
                          ),
                        ),
                        RoundedButton(
                            text: "Back",
                            press: () {
                              Navigator.pop(context);
                            },
                            color: colorMainBlue,
                            textColor: colorSystemWhite,
                            size: size.width * 0.3)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}