import 'package:appsche/domain/bloc/add_task/add_task_cubit.dart';
import 'package:appsche/widget/box_field.dart';
import 'package:appsche/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../../rsc/color.dart';
import '../../../rsc/text_style.dart';
import '../../../widget/button.dart';
import '../../../widget/date_picker.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);
  final f = DateFormat('MM/dd/yyyy');
  final l = DateFormat('hh:mm aa');

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
                Padding(
                    padding: EdgeInsets.only(
                      bottom: size.height * 0.02,
                    ),
                    child: InputField(
                      hintText: 'Enter title here ',
                      nameTitle: 'Title',
                      size: size.width,
                    )),
                Padding(
                    padding: EdgeInsets.only(
                      bottom: size.height * 0.02,
                    ),
                    child: InputField(
                      hintText: 'Enter note here ',
                      nameTitle: 'Note',
                      size: size.width,
                    )),
                Padding(
                    padding: EdgeInsets.only(
                      bottom: size.height * 0.02,
                    ),
                    child: BoxField(
                        hintText: f.format(DateTime.now()),
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
                            hintText: l.format(DateTime.now()),
                            nameTitle: 'Start time',
                            size: size.width * 0.42,
                            icon: const Icon(Icons.timer),
                            onTapped: () {})),
                    Padding(
                        padding: EdgeInsets.only(
                          bottom: size.height * 0.02,
                        ),
                        child: BoxField(
                            hintText: l.format(DateTime.now()),
                            nameTitle: 'End time',
                            size: size.width * 0.42,
                            icon: const Icon(Icons.timer),
                            onTapped: () {})),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                      bottom: size.height * 0.02,
                    ),
                    child: BoxField(
                        hintText: '5 minutes early',
                        nameTitle: 'Remind',
                        size: size.width,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        onTapped: () {})),
                Padding(
                    padding: EdgeInsets.only(
                      bottom: size.height * 0.02,
                    ),
                    child: BoxField(
                        hintText: 'None',
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
                            BlocBuilder<AddTaskCubit, AddTaskState>(
                                buildWhen: (pre, now) {
                              return pre.color != now.color;
                            }, builder: (context, state) {
                              return Container(
                                  height: size.height * 0.035,
                                  margin: EdgeInsets.only(
                                      right: size.width * 0.025),
                                  decoration: const BoxDecoration(
                                      color: colorWaringText,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  child:  Visibility(
                                    visible: state.color=="yellow" ? true: false,
                                    child: const Icon(
                                      Icons.done,
                                      color: colorSystemWhite,
                                    ),
                                  ));
                            }),BlocBuilder<AddTaskCubit, AddTaskState>(
                                buildWhen: (pre, now) {
                              return pre.color != now.color;
                            }, builder: (context, state) {
                              return Container(
                                  height: size.height * 0.035,

                                  decoration: const BoxDecoration(
                                      color: colorMainBlue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  child:  Visibility(
                                    visible: state.color=="blue" ? true: false,
                                    child: const Icon(
                                      Icons.done,
                                      color: colorSystemWhite,
                                    ),
                                  ));
                            }),BlocBuilder<AddTaskCubit, AddTaskState>(
                                buildWhen: (pre, now) {
                              return pre.color != now.color;
                            }, builder: (context, state) {
                              return state.color =="red" ? Container(
                                  height: size.height * 0.035,

                                  decoration: const BoxDecoration(
                                      color: colorErrorPrimary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  child:  const Icon(
                                    Icons.done,
                                    color: colorSystemWhite,
                                  )) :Container(
                                  height: size.height * 0.035,
                                  decoration: const BoxDecoration(
                                      color: colorErrorPrimary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35))),
                                  );
                            }),
                          ],
                        ),
                      ),
                      RoundedButton(
                          text: "Add",
                          press: () {},
                          color: colorMainBlue,
                          textColor: colorSystemWhite,
                          size: size.width * 0.3)
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
