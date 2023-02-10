import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../application/enum/home_status.dart';
import '../../repository/home/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  String emailMessage = "";
  String passMessage = "";
  HomeCubit({required HomeRepository homeRepository})
      : homeRepository = homeRepository,
        super(HomeState.initial());
  void dateChanged(DateTime value) {
    emit(state.copyWith(timeNow: value));
  }
}
