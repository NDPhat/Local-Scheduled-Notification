class Task{
  int ? id;
  String ?title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  String? color;
  String? remind;
  String ?repeat;

  Task({this.id, this.title, this.note, this.isCompleted, this.date,
      this.startTime, this.endTime, this.color, this.remind, this.repeat});
}