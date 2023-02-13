import 'package:appsche/data/local/driff/db/db_app.dart';

import '../../../data/models/task.dart';

extension TaskModel on TaskEntityData {
  Task toGetTaskModel() {
    return Task(
        id: id,
        title: title,
        note: note,
        isCompleted: isCompleted,
        date: dateSave,
        startTime: startTime,
        endTime: endTime,
        color: color,
        repeat: repeat,
        remind: remind);
  }
}
