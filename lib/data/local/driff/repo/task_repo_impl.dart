import 'package:appsche/data/local/driff/db/db_app.dart';
import 'package:appsche/data/local/driff/repo/task_repo.dart';
import 'package:drift/drift.dart';

class TaskLocalRepoImpl extends TaskLocalRepository {
  TaskLocalRepoImpl(super.appDb);

  @override
  Future<void> deleteTask(int taskId) async {
    await (appDb.delete(appDb.taskEntity)..where((t) => t.id.equals(taskId)))
        .go();
  }

  @override
  Stream<List<TaskEntityData>> getAllTask() async* {
    yield* (appDb.select(appDb.taskEntity)).watch();
  }

  @override
  Stream<List<TaskEntityData>> getAllTaskByDay(String dayNeeded) async* {
    yield* (appDb.select(appDb.taskEntity)
          ..where((tbl) => tbl.dateSave.equals(dayNeeded)))
        .watch();
  }

  @override
  Future<void> insertTask(TaskEntityCompanion entity) async {
    await appDb.into(appDb.taskEntity).insert(entity);
  }

  @override
  Future<void> updateTask(TaskEntityData entity) async {
    (appDb.update(appDb.taskEntity)..where((tbl) => tbl.id.equals(entity.id)))
        .write(const TaskEntityCompanion(isCompleted: Value(1)));
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
