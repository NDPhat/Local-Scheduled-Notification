part of 'add_task_cubit.dart';

class AddTaskState extends Equatable {
  String color;
  String title;
  String note;
  String noteMess;
  String titleMess;
  String dateSaveTask;
  AddTaskStatus status;
  String timeStart;
  String timeEnd;
  int indexRepeat;
  int indexRemind;
  String remind;
  String repeat;

  AddTaskState({
    required this.color,
    required this.status,
    required this.dateSaveTask,
    required this.timeStart,
    required this.timeEnd,
    required this.indexRemind,
    required this.remind,
    required this.title,
    required this.note,
    required this.noteMess,
    required this.titleMess,
    required this.repeat,
    required this.indexRepeat,

    //this.user,
  });
  factory AddTaskState.initial() {
    return AddTaskState(
      indexRemind: 0,
      indexRepeat: 0,
      remind: '5 minutes early',
      repeat: 'None',
      color: 'blue',
      note: '',
      title: '',
      noteMess: '',
      titleMess: '',
      dateSaveTask: formatDateInput.format(DateTime.now()),
      timeStart: formatTimeInput.format(DateTime.now()),
      timeEnd: formatTimeInput.format(DateTime.now()),
      status: AddTaskStatus.initial,
      //user: null,
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        color,
        status,
        dateSaveTask,
        title,
        note,
        noteMess,
        titleMess,
        timeEnd,
        timeStart,
        indexRemind,
        indexRepeat,
        remind,
        repeat
      ];

  AddTaskState copyWith(
      {String? color,
      AddTaskStatus? status,
      String? dateSave,
      String? remind,
      String? repeat,
      int? indexRemind,
      int? indexRepeat,
      String? timeEnd,
      String? titleMess,
      String? note,
      String? title,
      String? noteMess,
      String? timeStart
      // auth.user? user,
      }) {
    return AddTaskState(
      timeEnd: timeEnd ?? this.timeEnd,
      timeStart: timeStart ?? this.timeStart,
      color: color ?? this.color,
      note: note ?? this.note,
      title: title ?? this.title,
      noteMess: noteMess ?? this.noteMess,
      titleMess: titleMess ?? this.titleMess,
      repeat: repeat ?? this.repeat,
      remind: remind ?? this.remind,
      indexRepeat: indexRepeat ?? this.indexRepeat,
      indexRemind: indexRemind ?? this.indexRemind,
      dateSaveTask: dateSave ?? dateSaveTask,
      status: status ?? this.status,
      //user: user ?? this.user,
    );
  }
}
