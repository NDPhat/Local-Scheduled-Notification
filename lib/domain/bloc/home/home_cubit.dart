import 'package:appsche/application/utils/format/format_date.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../application/enum/home_status.dart';
import '../../../data/local/driff/repo/task_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TaskLocalRepository taskLocalRepository;
  String emailMessage = "";
  String passMessage = "";
  HomeCubit({required TaskLocalRepository taskLocalRepository})
      : taskLocalRepository = taskLocalRepository,
        super(HomeState.initial());
  void dateChanged(DateTime value) {
    emit(state.copyWith(timeNow: formatDateInput.format(value)));
  }
}
