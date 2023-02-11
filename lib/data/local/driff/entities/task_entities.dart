
import 'package:drift/drift.dart';

class TaskEntity extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().named('title')();
  TextColumn get note => text().named('note')();
  IntColumn get isCompleted => integer().named("isCompleted")();
  DateTimeColumn get dateSave => dateTime().named('dateSave')();
  TextColumn get startTime => text().named('startTime')();
  TextColumn get endTime => text().named('endTime')();
  TextColumn get color => text().named('color')();
  TextColumn get remind => text().named('remind')();
  TextColumn get repeat => text().named('repeat')();
}