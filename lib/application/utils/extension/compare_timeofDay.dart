import 'package:flutter/material.dart';

double convertTimeDayToDouble(TimeOfDay myTime) =>
    myTime.hour + myTime.minute / 60.0;

TimeOfDay convertToTimeOfDay(String timeDayString) {
  int hour = int.parse(timeDayString.split(":")[0]);
  int minute = int.parse(timeDayString.split(":")[1]);

  return TimeOfDay(hour: hour, minute: minute);
}
