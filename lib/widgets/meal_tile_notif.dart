// meal_tile.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MealTile extends StatelessWidget {
  final String mealName;
  final TimeOfDay mealTime;
  final bool notificationEnabled;
  final ValueChanged<TimeOfDay> onTimeChanged;
  final ValueChanged<bool> onNotificationChanged;

  const MealTile({
    super.key,
    required this.mealName,
    required this.mealTime,
    required this.notificationEnabled,
    required this.onTimeChanged,
    required this.onNotificationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(mealName),
      subtitle: Text(DateFormat.jm()
          .format(DateTime(2022, 1, 1, mealTime.hour, mealTime.minute))),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              TimeOfDay? selectedTime = await showTimePicker(
                context: context,
                initialTime: mealTime,
              );
              if (selectedTime != null) {
                onTimeChanged(selectedTime);
              }
            },
          ),
          Switch(
            value: notificationEnabled,
            onChanged: onNotificationChanged,
          ),
        ],
      ),
    );
  }
}
