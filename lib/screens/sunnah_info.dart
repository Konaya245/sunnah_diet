import 'package:flutter/material.dart';

class SunnahInfoPage extends StatelessWidget {
  const SunnahInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunnah Information'),
      ),
      body: ListView(
        children: [
          const ExpansionTile(title: Text('What is Sunnah Diet?'), children: [
            ListTile(
              title: Text('Sunnah Diet is a diet based on the Sunnah'),
            ),
          ]),
          const ExpansionTile(title: Text('Why Sunnah Diet?'), children: [
            ListTile(
              title: Text('Sunnah Diet is...'),
            ),
          ]),
          const ExpansionTile(
              title: Text('Health benefits to Sunnah Dieting'),
              children: [
                ListTile(
                  title: Text('Sunnah Diet is...'),
                ),
              ]),
          ListTile(
            title: const Text('Sunnah Foods'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SunnahFoodsPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Sunnah Eating Habits'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SunnahEatingHabitsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SunnahFoodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunnah Foods'),
      ),
      body: const Center(
        child: Text('This is the Sunnah Foods page'),
      ),
    );
  }
}

class SunnahEatingHabitsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunnah Eating Habits'),
      ),
      body: const Center(
        child: Text('This is the Sunnah Eating Habits page'),
      ),
    );
  }
}
