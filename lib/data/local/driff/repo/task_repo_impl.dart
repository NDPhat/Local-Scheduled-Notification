import 'package:appsche/data/local/driff/db/db_app.dart';
import 'package:appsche/data/local/driff/repo/task_repo.dart';

class TaskLocalRepoImpl extends TaskLocalRepository {
  TaskLocalRepoImpl(super.appDb);

  @override
  Future<void> deleteTask(TaskEntityCompanion entity) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Stream<List<TaskEntityData>> getAllTask() {
    // TODO: implement getAllTask
    throw UnimplementedError();
  }

  @override
  Stream<TaskEntityData?> getTaskByDay() {
    // TODO: implement getTaskByDay
    throw UnimplementedError();
  }

  @override
  Future<void> insertTask(TaskEntityCompanion entity) async {
    await appDb.into(appDb.taskEntity).insert(entity);
  }

  @override
  Future<void> updateTask(TaskEntityCompanion entity) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
  //
  // //WEIGHT IMPL
  // //INSERT
  // @override
  // Future<void> insertWeight(UserWeightCompanion entity) async {
  //   appDb.into(appDb.userWeight).insert(entity);
  // }
  //
  // //GET ALL BY DAY
  // @override
  // Stream<List<UserWeightData>> getAllWeightByDay() async* {
  //   yield* (appDb.select(appDb.userWeight)
  //     ..where((tbl) => tbl.dateSave.day.equals(DateTime.now().day)))
  //       .watch();
  // }
  //
  // //GET LATEST BY LAST DAY
  // @override
  // Stream<UserWeightData?> getLatestWeight() async* {
  //   yield* (appDb.select(appDb.userWeight)
  //     ..orderBy([
  //           (t) => OrderingTerm(expression: t.dateSave, mode: OrderingMode.desc)
  //     ]))
  //       .watch()
  //       .map((event) => event.first);
  // }
}
