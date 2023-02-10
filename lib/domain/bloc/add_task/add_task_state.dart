part of 'add_task_cubit.dart';

class AddTaskState extends Equatable {
  String color;
  AddTaskStatus status;

  AddTaskState({required this.color, required this.status
      //this.user,
      });
  factory AddTaskState.initial() {
    return AddTaskState(
      color: 'blue',
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
      ];

  AddTaskState copyWith({
    String? color,
    AddTaskStatus? status,
    // auth.user? user,
  }) {
    return AddTaskState(
      color: color ?? this.color,
      status: status ?? this.status,
      //user: user ?? this.user,
    );
  }
}
