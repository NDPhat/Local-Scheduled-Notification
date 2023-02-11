import 'package:appsche/application/enum/ask_task_enum.dart';
import 'package:appsche/data/local/driff/db/db_app.dart';
import 'package:appsche/data/local/driff/repo/task_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:drift/drift.dart';
import 'package:intl/intl.dart';
part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  String titleMess = "";
  String noteMess = "";
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

  void titleChanged(String value) {
    state.title = value;
    if (state.titleMess.isNotEmpty) {
      emit(state.copyWith(titleMess: ""));
    }
  }

  void noteChanged(String value) {
    state.note = value;
    if (state.noteMess.isNotEmpty) {
      emit(state.copyWith(noteMess: ""));
    }
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

  bool titleValidator(String title) {
    if (title.isEmpty) {
      titleMess = 'This field is empty';
      return false;
    } else {
      titleMess = "";
      return true;
    }
  }

  bool noteValidator(String note) {
    if (note.isEmpty) {
      noteMess = 'This field is empty';
      return false;
    } else {
      noteMess = "";
      return true;
    }
  }

  bool isFormValid() {
    if (noteValidator(state.note) & titleValidator(state.title)) {
      return true;
    }
    return false;
  }

  Future<void> saveTaskToLocal() async {
    emit(state.copyWith(status: AddTaskStatus.initial));
    if (isFormValid()) {
      try {
        final entity = TaskEntityCompanion(
          title: Value(state.title),
          note: Value(state.note),
          dateSave: Value(state.dateSaveTask),
          startTime: Value(state.timeStart),
          endTime: Value(state.timeEnd),
          remind: Value(state.remind),
          repeat: Value(state.repeat),
          isCompleted: const Value(1),
          color: Value(state.color),
        );
        //insert task
        taskLocalRepository.insertTask(entity);
      } on Exception catch (e) {
        print(e.toString());
      }
    } else {
      emit(state.copyWith(
          titleMess: titleMess,
          noteMess: noteMess,
          status: AddTaskStatus.error));
    }
  }
}
