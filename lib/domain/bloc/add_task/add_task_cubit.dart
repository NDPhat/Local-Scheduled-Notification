import 'package:appsche/application/enum/ask_task_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import '../../../application/enum/home_status.dart';
import '../../repository/home/home_repo.dart';
part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final HomeRepository homeRepository;
  AddTaskCubit({required HomeRepository homeRepository})
      : homeRepository = homeRepository,
        super(AddTaskState.initial());
  void colorChange(String color) {
    emit(state.copyWith(color: color));
  }
}
