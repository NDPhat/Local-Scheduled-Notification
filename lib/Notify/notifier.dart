import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../data/models/task.dart';

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //
  initializeNotification() async {
    configTimeZone();
    tz.initializeTimeZones();

    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("appicon");

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    // await flutterLocalNotificationsPlugin.initialize(
    //     initializationSettings,
    //     onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  displayNotification({required String title, required String body}) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high);
    var platformChannelSpecifics =
        new NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'It could be anything you pass',
    );
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
  }

  scheduledNotification(int hour, int minute, Task task) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        task.id!.toInt(),
        task.title.toString(),
        task.note.toString(),
        _convertTime(hour, minute),
        // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'channel.id', 'channel.name', 'your channel description',
                sound: UriAndroidNotificationSound("assets/image/sound.mp3"),
                playSound: true)),
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: "${task.title}" "${task.note}");
  }

  scheduledRepeatNotification(
      int dayMore, int hour, int minute, Task task) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        task.id!.toInt(),
        task.title.toString(),
        task.note.toString(),
        _convertTimeForRepeat(dayMore, hour, minute),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'channel.id', 'channel.name', 'your channel description',
                sound: UriAndroidNotificationSound("assets/image/sound.mp3"),
                playSound: true)),
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: "${task.title}" "${task.note}");
  }

  Future<void> configTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  tz.TZDateTime _convertTime(int hour, int minute) {
    final tz.TZDateTime timeNow = tz.TZDateTime.now(tz.local);
    tz.TZDateTime schedule = tz.TZDateTime(
        tz.local, timeNow.year, timeNow.month, timeNow.day, hour, minute);
    if (schedule.isBefore(timeNow)) {
      schedule = schedule.add(const Duration(days: 1));
    }
    return schedule;
  }

  tz.TZDateTime _convertTimeForRepeat(int day, int hour, int minute) {
    final tz.TZDateTime timeNow = tz.TZDateTime.now(tz.local);
    tz.TZDateTime schedule = tz.TZDateTime(
        tz.local, timeNow.year, timeNow.month, timeNow.day + day, hour, minute);
    if (schedule.isBefore(timeNow)) {
      schedule = schedule.add(const Duration(days: 1));
    }
    return schedule;
  }
}
