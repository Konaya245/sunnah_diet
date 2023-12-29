import 'package:flutter/material.dart';

class SunnahHabits extends StatelessWidget {
  const SunnahHabits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunnah Habits'),
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(habit.title),
            subtitle: Text(habit.description),
          );
        },
      ),
    );
  }
}

class Habit {
  final String title;
  final String description;

  Habit(this.title, this.description);
}

final List<Habit> habits = [
  Habit('Praying Fajr', 'Praying the dawn prayer'),
  Habit('Eating with Right Hand', 'Eating with the right hand'),
  Habit('Using Miswak', 'Using a tooth-stick for oral hygiene'),
  // Add more habits here
];
