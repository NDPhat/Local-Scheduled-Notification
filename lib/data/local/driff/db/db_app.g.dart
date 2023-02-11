// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_app.dart';

// ignore_for_file: type=lint
class $TaskEntityTable extends TaskEntity
    with TableInfo<$TaskEntityTable, TaskEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<int> isCompleted = GeneratedColumn<int>(
      'isCompleted', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateSaveMeta =
      const VerificationMeta('dateSave');
  @override
  late final GeneratedColumn<DateTime> dateSave = GeneratedColumn<DateTime>(
      'dateSave', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
      'startTime', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
      'endTime', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _remindMeta = const VerificationMeta('remind');
  @override
  late final GeneratedColumn<String> remind = GeneratedColumn<String>(
      'remind', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _repeatMeta = const VerificationMeta('repeat');
  @override
  late final GeneratedColumn<String> repeat = GeneratedColumn<String>(
      'repeat', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        note,
        isCompleted,
        dateSave,
        startTime,
        endTime,
        color,
        remind,
        repeat
      ];
  @override
  String get aliasedName => _alias ?? 'task_entity';
  @override
  String get actualTableName => 'task_entity';
  @override
  VerificationContext validateIntegrity(Insertable<TaskEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('isCompleted')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['isCompleted']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    if (data.containsKey('dateSave')) {
      context.handle(_dateSaveMeta,
          dateSave.isAcceptableOrUnknown(data['dateSave']!, _dateSaveMeta));
    } else if (isInserting) {
      context.missing(_dateSaveMeta);
    }
    if (data.containsKey('startTime')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['startTime']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('endTime')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['endTime']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('remind')) {
      context.handle(_remindMeta,
          remind.isAcceptableOrUnknown(data['remind']!, _remindMeta));
    } else if (isInserting) {
      context.missing(_remindMeta);
    }
    if (data.containsKey('repeat')) {
      context.handle(_repeatMeta,
          repeat.isAcceptableOrUnknown(data['repeat']!, _repeatMeta));
    } else if (isInserting) {
      context.missing(_repeatMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}isCompleted'])!,
      dateSave: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dateSave'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}startTime'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}endTime'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      remind: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remind'])!,
      repeat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}repeat'])!,
    );
  }

  @override
  $TaskEntityTable createAlias(String alias) {
    return $TaskEntityTable(attachedDatabase, alias);
  }
}

class TaskEntityData extends DataClass implements Insertable<TaskEntityData> {
  final int id;
  final String title;
  final String note;
  final int isCompleted;
  final DateTime dateSave;
  final String startTime;
  final String endTime;
  final String color;
  final String remind;
  final String repeat;
  const TaskEntityData(
      {required this.id,
      required this.title,
      required this.note,
      required this.isCompleted,
      required this.dateSave,
      required this.startTime,
      required this.endTime,
      required this.color,
      required this.remind,
      required this.repeat});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['note'] = Variable<String>(note);
    map['isCompleted'] = Variable<int>(isCompleted);
    map['dateSave'] = Variable<DateTime>(dateSave);
    map['startTime'] = Variable<String>(startTime);
    map['endTime'] = Variable<String>(endTime);
    map['color'] = Variable<String>(color);
    map['remind'] = Variable<String>(remind);
    map['repeat'] = Variable<String>(repeat);
    return map;
  }

  TaskEntityCompanion toCompanion(bool nullToAbsent) {
    return TaskEntityCompanion(
      id: Value(id),
      title: Value(title),
      note: Value(note),
      isCompleted: Value(isCompleted),
      dateSave: Value(dateSave),
      startTime: Value(startTime),
      endTime: Value(endTime),
      color: Value(color),
      remind: Value(remind),
      repeat: Value(repeat),
    );
  }

  factory TaskEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskEntityData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      note: serializer.fromJson<String>(json['note']),
      isCompleted: serializer.fromJson<int>(json['isCompleted']),
      dateSave: serializer.fromJson<DateTime>(json['dateSave']),
      startTime: serializer.fromJson<String>(json['startTime']),
      endTime: serializer.fromJson<String>(json['endTime']),
      color: serializer.fromJson<String>(json['color']),
      remind: serializer.fromJson<String>(json['remind']),
      repeat: serializer.fromJson<String>(json['repeat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'note': serializer.toJson<String>(note),
      'isCompleted': serializer.toJson<int>(isCompleted),
      'dateSave': serializer.toJson<DateTime>(dateSave),
      'startTime': serializer.toJson<String>(startTime),
      'endTime': serializer.toJson<String>(endTime),
      'color': serializer.toJson<String>(color),
      'remind': serializer.toJson<String>(remind),
      'repeat': serializer.toJson<String>(repeat),
    };
  }

  TaskEntityData copyWith(
          {int? id,
          String? title,
          String? note,
          int? isCompleted,
          DateTime? dateSave,
          String? startTime,
          String? endTime,
          String? color,
          String? remind,
          String? repeat}) =>
      TaskEntityData(
        id: id ?? this.id,
        title: title ?? this.title,
        note: note ?? this.note,
        isCompleted: isCompleted ?? this.isCompleted,
        dateSave: dateSave ?? this.dateSave,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        color: color ?? this.color,
        remind: remind ?? this.remind,
        repeat: repeat ?? this.repeat,
      );
  @override
  String toString() {
    return (StringBuffer('TaskEntityData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dateSave: $dateSave, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('color: $color, ')
          ..write('remind: $remind, ')
          ..write('repeat: $repeat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, note, isCompleted, dateSave,
      startTime, endTime, color, remind, repeat);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskEntityData &&
          other.id == this.id &&
          other.title == this.title &&
          other.note == this.note &&
          other.isCompleted == this.isCompleted &&
          other.dateSave == this.dateSave &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.color == this.color &&
          other.remind == this.remind &&
          other.repeat == this.repeat);
}

class TaskEntityCompanion extends UpdateCompanion<TaskEntityData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> note;
  final Value<int> isCompleted;
  final Value<DateTime> dateSave;
  final Value<String> startTime;
  final Value<String> endTime;
  final Value<String> color;
  final Value<String> remind;
  final Value<String> repeat;
  const TaskEntityCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.note = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.dateSave = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.color = const Value.absent(),
    this.remind = const Value.absent(),
    this.repeat = const Value.absent(),
  });
  TaskEntityCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String note,
    required int isCompleted,
    required DateTime dateSave,
    required String startTime,
    required String endTime,
    required String color,
    required String remind,
    required String repeat,
  })  : title = Value(title),
        note = Value(note),
        isCompleted = Value(isCompleted),
        dateSave = Value(dateSave),
        startTime = Value(startTime),
        endTime = Value(endTime),
        color = Value(color),
        remind = Value(remind),
        repeat = Value(repeat);
  static Insertable<TaskEntityData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? note,
    Expression<int>? isCompleted,
    Expression<DateTime>? dateSave,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<String>? color,
    Expression<String>? remind,
    Expression<String>? repeat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (note != null) 'note': note,
      if (isCompleted != null) 'isCompleted': isCompleted,
      if (dateSave != null) 'dateSave': dateSave,
      if (startTime != null) 'startTime': startTime,
      if (endTime != null) 'endTime': endTime,
      if (color != null) 'color': color,
      if (remind != null) 'remind': remind,
      if (repeat != null) 'repeat': repeat,
    });
  }

  TaskEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? note,
      Value<int>? isCompleted,
      Value<DateTime>? dateSave,
      Value<String>? startTime,
      Value<String>? endTime,
      Value<String>? color,
      Value<String>? remind,
      Value<String>? repeat}) {
    return TaskEntityCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      isCompleted: isCompleted ?? this.isCompleted,
      dateSave: dateSave ?? this.dateSave,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      color: color ?? this.color,
      remind: remind ?? this.remind,
      repeat: repeat ?? this.repeat,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (isCompleted.present) {
      map['isCompleted'] = Variable<int>(isCompleted.value);
    }
    if (dateSave.present) {
      map['dateSave'] = Variable<DateTime>(dateSave.value);
    }
    if (startTime.present) {
      map['startTime'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['endTime'] = Variable<String>(endTime.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (remind.present) {
      map['remind'] = Variable<String>(remind.value);
    }
    if (repeat.present) {
      map['repeat'] = Variable<String>(repeat.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskEntityCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dateSave: $dateSave, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('color: $color, ')
          ..write('remind: $remind, ')
          ..write('repeat: $repeat')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $TaskEntityTable taskEntity = $TaskEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskEntity];
}
