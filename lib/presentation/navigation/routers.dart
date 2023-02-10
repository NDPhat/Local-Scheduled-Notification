import 'package:appsche/domain/bloc/add_task/add_task_cubit.dart';
import 'package:appsche/domain/bloc/home/home_cubit.dart';
import 'package:appsche/domain/repository/home/home_repo.dart';
import 'package:appsche/presentation/screen/add_task/add_task_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screen/home/home_screen.dart';

class Routers {
  static const String home = '/';
  static const String addTask = '/addTask';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => route(settings),
        settings: RouteSettings(name: settings.name));
  }

  static route(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return BlocProvider(
            create: (context) => HomeCubit(homeRepository: HomeRepository()),
            child: HomeScreen());
      case addTask:
        return BlocProvider(
            create: (context) => AddTaskCubit(homeRepository: HomeRepository()),
            child:  AddTask());

      default:
        return HomeScreen();
    }
  }
}
