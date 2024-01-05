import 'package:flutter/material.dart';
import 'package:sunnah_diet/services/preferences_service.dart';
import 'package:sunnah_diet/widgets/meal_tile_notif.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sunnah_diet/services/auth.dart';
import 'package:sunnah_diet/services/notification_service.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationService = NotificationService();
  final User? user = Auth().currentUser;
  late final PreferencesService _preferencesService;
  late final String currentUserId;
  TimeOfDay breakfastTime = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay lunchTime = const TimeOfDay(hour: 12, minute: 0);
  TimeOfDay dinnerTime = const TimeOfDay(hour: 18, minute: 0);
  bool enableBreakfastNotification = true;
  bool enableLunchNotification = true;
  bool enableDinnerNotification = true;
  bool enableCaloriesRemainingNotification = true;
  bool enableWaterReminder = true;
  bool enableSunnahInfoTips = true;

  @override
  void initState() {
    super.initState();
    currentUserId = user?.uid ?? '0';
    _preferencesService = PreferencesService(currentUserId);
    loadPreferences();
  }

  void loadPreferences() async {
    breakfastTime = await _preferencesService.getBreakfastTime();
    lunchTime = await _preferencesService.getLunchTime();
    dinnerTime = await _preferencesService.getDinnerTime();
    enableBreakfastNotification =
        await _preferencesService.getBreakfastNotificationEnabled();
    enableLunchNotification =
        await _preferencesService.getLunchNotificationEnabled();
    enableDinnerNotification =
        await _preferencesService.getDinnerNotificationEnabled();
    setState(() {});
  }

  void savePreferences() async {
    await _preferencesService.setBreakfastTime(breakfastTime);
    await _preferencesService.setLunchTime(lunchTime);
    await _preferencesService.setDinnerTime(dinnerTime);
    await _preferencesService
        .setBreakfastNotificationEnabled(enableBreakfastNotification);
    await _preferencesService
        .setLunchNotificationEnabled(enableLunchNotification);
    await _preferencesService
        .setDinnerNotificationEnabled(enableDinnerNotification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          const Divider(),
          const SizedBox(height: 8.0),
          const Text(
            'Meals',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          MealTile(
            mealName: 'Breakfast',
            mealTime: breakfastTime,
            notificationEnabled: enableBreakfastNotification,
            onTimeChanged: (TimeOfDay time) {
              setState(() {
                breakfastTime = time;
              });
              savePreferences();
              if (enableBreakfastNotification) {
                notificationService.scheduleNotification(
                    breakfastTime, 'Breakfast', 0);
              } else {
                notificationService.cancelNotification(0);
              }
            },
            onNotificationChanged: (bool enabled) {
              setState(() {
                enableBreakfastNotification = enabled;
              });
              savePreferences();
              if (enabled) {
                notificationService.scheduleNotification(
                    breakfastTime, 'Breakfast', 0);
              } else {
                notificationService.cancelNotification(0);
              }
            },
          ),
          MealTile(
            mealName: 'Lunch',
            mealTime: lunchTime,
            notificationEnabled: enableLunchNotification,
            onTimeChanged: (TimeOfDay time) {
              setState(() {
                lunchTime = time;
              });
              savePreferences();
              if (enableLunchNotification) {
                notificationService.scheduleNotification(lunchTime, 'Lunch', 1);
              } else {
                notificationService.cancelNotification(1);
              }
            },
            onNotificationChanged: (bool enabled) {
              setState(() {
                enableLunchNotification = enabled;
              });
              savePreferences();
              if (enableLunchNotification) {
                notificationService.scheduleNotification(lunchTime, 'Lunch', 1);
              } else {
                notificationService.cancelNotification(1);
              }
            },
          ),
          MealTile(
            mealName: 'Dinner',
            mealTime: dinnerTime,
            notificationEnabled: enableDinnerNotification,
            onTimeChanged: (TimeOfDay time) {
              setState(() {
                dinnerTime = time;
              });
              savePreferences();
              if (enableDinnerNotification) {
                notificationService.scheduleNotification(
                    dinnerTime, 'Dinner', 2);
              } else {
                notificationService.cancelNotification(2);
              }
            },
            onNotificationChanged: (bool enabled) {
              setState(() {
                enableDinnerNotification = enabled;
              });
              savePreferences();
              if (enableDinnerNotification) {
                notificationService
                    .scheduleNotification(dinnerTime, 'Dinner', 2)
                    .then((_) {
                  notificationService.checkNotification(2);
                });
              } else {
                notificationService.cancelNotification(2).then((_) {
                  notificationService.checkNotification(2);
                });
              }
            },
          ),
          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 8.0),
          const Text(
            'Others',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SwitchListTile(
            title: const Text('Calories Remaining Reminder'),
            value:
                enableCaloriesRemainingNotification, // Replace with user-editable value
            onChanged: (bool enabled) {
              setState(() {
                enableCaloriesRemainingNotification = enabled;
              });

              if (enableCaloriesRemainingNotification) {
                // notificationService.scheduleCaloriesRemainingNotification();
              } else {
                // notificationService.cancelCaloriesRemainingNotification(); // Cancel the notification
              }
            },
          ),
          SwitchListTile(
            title: const Text('Water Reminder'),
            value: enableWaterReminder, // Replace with user-editable value
            onChanged: (bool enabled) {
              setState(() {
                enableWaterReminder = enabled;
              });
              if (enableWaterReminder) {
                // Schedule the water reminder
                // notificationService.scheduleWaterReminder();
              } else {
                // Cancel the water reminder
                // notificationService.cancelWaterReminder();
              }
            },
          ),
          SwitchListTile(
            title: const Text('Sunnah Info Tips'),
            value: enableSunnahInfoTips, // Replace with user-editable value
            onChanged: (bool enabled) {
              setState(() {
                enableSunnahInfoTips = enabled;
              });
              if (enableWaterReminder) {
                // Schedule the sunnah info tips
                // notificationService.scheduleSunnahInfoTips();
              } else {
                // Cancel the sunnah info tips
                // notificationService.cancelSunnahInfoTips();
              }
            },
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     //perms work
          //     // notificationService.showNotificationNow();
          //     notificationService.getNotifications().then((notifications) {
          //       print(notifications);
          //     });
          //   },
          //   child: const Text('Show Notification Now'),
          // ),
        ],
      ),
    );
  }
}
