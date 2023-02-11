import '../db/db_app.dart';

abstract class TaskLocalRepository {
  //Define DB
  final AppDb appDb;
  //Constructor
  TaskLocalRepository(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertTask(TaskEntityCompanion entity);
  Future<void> deleteTask(TaskEntityCompanion entity);
  Future<void> updateTask(TaskEntityCompanion entity);
  Stream<TaskEntityData?> getTaskByDay();
  Stream<List<TaskEntityData>> getAllTask();
}
