import 'package:appsche/application/enum/ask_task_enum.dart';
import 'package:appsche/data/local/driff/db/db_app.dart';
import 'package:appsche/data/local/driff/repo/task_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:drift/drift.dart';
import 'package:intl/intl.dart';

import '../../../application/utils/format/format_date.dart';
part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  String titleMess = "";
  String noteMess = "";
  final TaskLocalRepository taskLocalRepository;
  AddTaskCubit({required TaskLocalRepository taskLocalRepository})
      : taskLocalRepository = taskLocalRepository,
        super(AddTaskState.initial());
  void colorChange(String color) {
    emit(state.copyWith(color: color, status: AddTaskStatus.initial));
  }

  void dateTimeChange(String date) {
    state.dateSaveTask = date;
  }

  void emitDateTimeChange(String date) {
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

  void clearOldDataErrorForm() {
    emit(state.copyWith(status: AddTaskStatus.initial));
  }

  void clearForm() {
    emit(state.copyWith(
      indexRemind: 0,
      indexRepeat: 0,
      remind: '5 minutes early',
      repeat: 'None',
      color: 'blue',
      note: '',
      title: '',
      noteMess: '',
      titleMess: '',
      dateSave: formatDateInput.format(DateTime.now()),
      timeStart: DateFormat('hh:mm aa').format(DateTime.now()),
      timeEnd: DateFormat('hh:mm aa').format(DateTime.now()),
      status: AddTaskStatus.initial,
    ));
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
    if (isFormValid()) {
      try {
        final entity = TaskEntityCompanion(
          title: Value(state.title),
          note: Value(state.note),
          dateSave: Value(state.dateSaveTask.toString()),
          startTime: Value(state.timeStart),
          endTime: Value(state.timeEnd),
          remind: Value(state.remind),
          repeat: Value(state.repeat),
          isCompleted: const Value(0),
          color: Value(state.color),
        );
        //insert task
        await taskLocalRepository.insertTask(entity);
        emit(state.copyWith(status: AddTaskStatus.success));
      } on Exception catch (e) {
        print(e.toString());
        emit(state.copyWith(
            titleMess: titleMess,
            noteMess: noteMess,
            status: AddTaskStatus.error));
      }
    } else {
      emit(state.copyWith(
          titleMess: titleMess,
          noteMess: noteMess,
          status: AddTaskStatus.error));
    }
  }
}
