import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' show Platform;
// import 'dart:math';
// import 'package:sunnah_diet/views/food_diary/food_diary.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService() {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      // iOS: IOSInitializationSettings(
      //     requestAlertPermission: true,
      //     requestBadgePermission: true,
      //     requestSoundPermission: true,
      //     onDidReceiveLocalNotification:
      //         (int id, String? title, String? body, String? payload) async {}),
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleNotification(
      TimeOfDay time, String mealName, int id) async {
    // Request the SCHEDULE_EXACT_ALARM permission
    if (Platform.isAndroid) {
      var status = await Permission.scheduleExactAlarm.status;
      if (!status.isGranted) {
        status = await Permission.scheduleExactAlarm.request();
        if (!status.isGranted) {
          return;
        }
      }
    }
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'meal_reminder',
      'Meal Reminder',
      channelDescription: 'Remember to have your meal',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    // var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      // iOS: iOSPlatformChannelSpecifics,
    );

    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, time.hour, time.minute);

    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }

    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        'Meal Reminder',
        'It\'s time for $mealName! Be sure to have your meal to not miss your calorie goals.',
        scheduleDate,
        platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      print('Notification $mealName with id $id is scheduled at $time.');
    } catch (e) {
      print('Failed to schedule notification: $e');
    }
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

//for testing notifs
  Future<void> checkNotification(int id) async {
    final List<PendingNotificationRequest> pendingNotifications =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    if (pendingNotifications.any((notification) => notification.id == id)) {
      print('Notification with id $id is scheduled.');
    } else {
      print('Notification with id $id is not scheduled.');
    }
  }

  //testing if notifs perms work
  Future<void> showNotificationNow() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );
    // var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      // iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      7, // Notification ID
      'Test Notification', // Notification title
      'This is the body of the notification', // Notification body
      platformChannelSpecifics,
    );
  }

  //test pending active notifs
  Future<Map<String, dynamic>> getNotifications() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    final List<ActiveNotification> activeNotifications =
        await flutterLocalNotificationsPlugin.getActiveNotifications();

    return {
      'pending': pendingNotificationRequests,
      'active': activeNotifications,
    };
  }

  // void scheduleCaloriesRemainingNotification() async {
  //   var rng = Random();
  //   var scheduledHour =
  //       rng.nextInt(7) + 12; // Generate a random hour between 12 and 18
  //   var scheduledMinute = rng.nextInt(60);

  //   var now = DateTime.now();
  //   var scheduledDate =
  //       DateTime(now.year, now.month, now.day, scheduledHour, scheduledMinute);

  //   if (scheduledDate.isBefore(now)) {
  //     scheduledDate = scheduledDate.add(const Duration(days: 1));
  //   }

  //   var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
  //     'calories_channel_id',
  //     'Calories Remaining Notification',
  //     channelDescription:
  //         'This notification goes off at a random time each day between noon and 7 PM',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     showWhen: false,
  //   );
  //   // var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  //   var platformChannelSpecifics = NotificationDetails(
  //     android: androidPlatformChannelSpecifics,
  //     // iOS: iOSPlatformChannelSpecifics,
  //   );

  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     4,
  //     'Calories Remaining Notification',
  //     'You have ${FoodDiaryScreen.getremainingCalories} calories remaining for today!', // Use the calories_remaining value from food_diary.dart
  //     tz.TZDateTime.from(scheduledDate, tz.local),
  //     platformChannelSpecifics,
  //     androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //     matchDateTimeComponents: DateTimeComponents.time,
  //   );
  // }
}
