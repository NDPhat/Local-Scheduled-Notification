import 'package:appsche/domain/bloc/add_task/add_task_cubit.dart';
import 'package:appsche/domain/bloc/home/home_cubit.dart';
import 'package:appsche/main.dart';
import 'package:appsche/presentation/screen/add_task/add_task_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/driff/repo/task_repo.dart';
import '../screen/detail_task/detail_task_screen.dart';
import '../screen/home/home_screen.dart';

class Routers {
  static const String home = '/';
  static const String addTask = '/addTask';
  static const String detailTask = '/detailTask';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => route(settings),
        settings:
            RouteSettings(name: settings.name, arguments: settings.arguments));
  }

  static route(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return BlocProvider(
            create: (context) => HomeCubit(
                taskLocalRepository: instance.get<TaskLocalRepository>()),
            child: HomeScreen());
      case addTask:
        return BlocProvider(
            create: (context) => AddTaskCubit(
                taskLocalRepository: instance.get<TaskLocalRepository>()),
            child: AddTask());
      case detailTask:
        return DetailTask();
      default:
        return HomeScreen();
    }
  }
}
