import 'package:flutter/material.dart';
import 'package:sunnah_diet/views/food_diary/food_diary.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: const Text('Calories Remaining'),
              subtitle: Center(
                child: SizedBox(
                  width: 100, // Set the width
                  height: 100, // Set the height
                  child: CircularProgressIndicator(
                    value: progress, // Use the progress value here
                    color: Colors.green,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/food_diary');
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: const Text('Cups of Water Drunk'),
              subtitle: const Text('Circular Progress Bar'),
              onTap: () {
                Navigator.pushNamed(context, '/food_diary');
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: const Text('Daily Sunnah Food'),
              subtitle: const Text('Random Item'),
              onTap: () {
                // Handle onTap for Daily Sunnah Food
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: const Text('Daily Sunnah Habit'),
              subtitle: const Text('Random Item'),
              onTap: () {
                // Handle onTap for Daily Sunnah Habit
              },
            ),
          ),
        ],
      ),
    );
  }
}
