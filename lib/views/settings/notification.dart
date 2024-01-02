import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
          const ListTile(
            title: Text('Breakfast'),
            trailing: Text('8:00 AM'), // Replace with user-editable time
          ),
          const ListTile(
            title: Text('Lunch'),
            trailing: Text('12:00 PM'), // Replace with user-editable time
          ),
          const ListTile(
            title: Text('Dinner'),
            trailing: Text('7:00 PM'), // Replace with user-editable time
          ),
          const SizedBox(height: 16.0),
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: true, // Replace with user-editable value
            onChanged: (value) {
              // Handle notification enable/disable
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
            value: true, // Replace with user-editable value
            onChanged: (value) {
              // Handle calories remaining reminder enable/disable
            },
          ),
          SwitchListTile(
            title: const Text('Water Reminder'),
            value: true, // Replace with user-editable value
            onChanged: (value) {
              // Handle water reminder enable/disable
            },
          ),
          SwitchListTile(
            title: const Text('Sunnah Info Tips'),
            value: true, // Replace with user-editable value
            onChanged: (value) {
              // Handle sunnah info tips enable/disable
            },
          ),
        ],
      ),
    );
  }
}
