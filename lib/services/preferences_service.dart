import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String userId;
  PreferencesService(this.userId);

  Future<TimeOfDay> getBreakfastTime() async {
    final SharedPreferences prefs = await _prefs;
    final String? timeString = prefs.getString('breakfastTime_$userId');
    if (timeString != null) {
      final timeParts = timeString.split(':');
      return TimeOfDay(
          hour: int.parse(timeParts[0]), minute: int.parse(timeParts[1]));
    } else {
      return const TimeOfDay(hour: 8, minute: 0); // Default value
    }
  }

  Future<void> setBreakfastTime(TimeOfDay time) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('breakfastTime_$userId', '${time.hour}:${time.minute}');
  }

  Future<TimeOfDay> getLunchTime() async {
    final SharedPreferences prefs = await _prefs;
    final String? timeString = prefs.getString('lunchTime_$userId');
    if (timeString != null) {
      final timeParts = timeString.split(':');
      return TimeOfDay(
          hour: int.parse(timeParts[0]), minute: int.parse(timeParts[1]));
    } else {
      return const TimeOfDay(hour: 12, minute: 0); // Default value
    }
  }

  Future<void> setLunchTime(TimeOfDay time) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('lunchTime_$userId', '${time.hour}:${time.minute}');
  }

  Future<TimeOfDay> getDinnerTime() async {
    final SharedPreferences prefs = await _prefs;
    final String? timeString = prefs.getString('dinnerTime_$userId');
    if (timeString != null) {
      final timeParts = timeString.split(':');
      return TimeOfDay(
          hour: int.parse(timeParts[0]), minute: int.parse(timeParts[1]));
    } else {
      return const TimeOfDay(hour: 18, minute: 0); // Default value
    }
  }

  Future<void> setDinnerTime(TimeOfDay time) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('dinnerTime_$userId', '${time.hour}:${time.minute}');
  }

  Future<bool> getBreakfastNotificationEnabled() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('enableBreakfastNotification_$userId') ?? true;
  }

  Future<void> setBreakfastNotificationEnabled(bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('enableBreakfastNotification_$userId', value);
  }

  Future<bool> getLunchNotificationEnabled() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('enableLunchNotification_$userId') ?? true;
  }

  Future<void> setLunchNotificationEnabled(bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('enableLunchNotification_$userId', value);
  }

  Future<bool> getDinnerNotificationEnabled() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('enableDinnerNotification_$userId') ?? true;
  }

  Future<void> setDinnerNotificationEnabled(bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('enableDinnerNotification_$userId', value);
  }

  Future<int> getMaxCalories() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt('maxCalories_$userId') ?? 2000; // Default value
  }

  Future<void> setMaxCalories(int maxCalories) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('maxCalories_$userId', maxCalories);
  }
}
