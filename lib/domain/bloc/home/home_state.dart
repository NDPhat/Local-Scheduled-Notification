part of 'home_cubit.dart';

class HomeState extends Equatable {
  DateTime timeNow;
  HomeStatus status;

  HomeState({
    required this.timeNow,
    required this.status,
    //this.user,
  });
  factory HomeState.initial() {
    return HomeState(
      timeNow: DateTime.now(),
      status: HomeStatus.initial,
      //user: null,
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        timeNow,
        status,
      ];

  HomeState copyWith({
    DateTime? timeNow,
    HomeStatus? status,
    // auth.user? user,
  }) {
    return HomeState(
      timeNow: timeNow ?? this.timeNow,
      status: status ?? this.status,
      //user: user ?? this.user,
    );
  }
}
