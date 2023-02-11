import 'package:appsche/application/enum/ask_task_enum.dart';
import 'package:appsche/data/local/driff/db/db_app.dart';
import 'package:appsche/data/local/driff/repo/task_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:drift/drift.dart';
import 'package:intl/intl.dart';
part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final TaskLocalRepository taskLocalRepository;
  AddTaskCubit({required TaskLocalRepository taskLocalRepository})
      : taskLocalRepository = taskLocalRepository,
        super(AddTaskState.initial());
  void colorChange(String color) {
    emit(state.copyWith(color: color));
  }

  void dateTimeChange(DateTime date) {
    state.dateSaveTask = date;
  }

  void emitDateTimeChange(DateTime date) {
    emit(state.copyWith(dateSave: date));
  }

  void emitStartTimeChange(String time) {
    emit(state.copyWith(timeStart: time));
  }

  void emitEndTimeChange(String time) {
    emit(state.copyWith(timeEnd: time));
  }

  void remindChange(int value) {
    emit(state.copyWith(indexRemind: value));
  }

  void remindSelected(String value) {
    emit(state.copyWith(remind: value));
  }

  void repeatChange(int value) {
    emit(state.copyWith(indexRepeat: value));
  }

  void repeatSelected(String value) {
    emit(state.copyWith(repeat: value));
  }

  Future<void> saveTaskToLocal() async {
    try {
      final entity = TaskEntityCompanion(
        title: Value(state.title),
        note: Value(state.note),
      );
      //insert task
      taskLocalRepository.insertTask(entity);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
