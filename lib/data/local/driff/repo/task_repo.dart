import '../db/db_app.dart';

abstract class TaskLocalRepository {
  //Define DB
  final AppDb appDb;
  //Constructor
  TaskLocalRepository(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertTask(TaskEntityCompanion entity);
  Future<void> deleteTask(int taskId);
  Future<void> updateTask(TaskEntityData entity);
  Stream<List<TaskEntityData>> getAllTaskByDay(String dayNeeded);
  Stream<List<TaskEntityData>> getAllTask();
}
