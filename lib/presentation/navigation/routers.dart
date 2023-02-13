import 'package:appsche/domain/bloc/add_task/add_task_cubit.dart';
import 'package:appsche/domain/bloc/home/home_cubit.dart';
import 'package:appsche/main.dart';
import 'package:appsche/presentation/screen/add_task/add_task_screen.dart';
import 'package:appsche/presentation/screen/intro/intro_screen.dart';
import 'package:appsche/presentation/screen/login/login_screen.dart';
import 'package:appsche/presentation/screen/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/driff/repo/task_repo.dart';
import '../screen/detail_task/detail_task_screen.dart';
import '../screen/home/home_screen.dart';

class Routers {
  static const String home = '/home';
  static const String splash = '/';
  static const String intro = '/intro';

  static const String addTask = '/addTask';
  static const String login = '/login';
  static const String detailTask = '/detailTask';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => route(settings),
        settings:
            RouteSettings(name: settings.name, arguments: settings.arguments));
  }

  static route(RouteSettings settings) {
    switch (settings.name) {
      case intro:
        return IntroScreen();
      case splash:
        return const SplashScreen();
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
      case login:
        return const LoginScreen();
      default:
        return HomeScreen();
    }
  }
}
