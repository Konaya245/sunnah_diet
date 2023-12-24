import 'package:flutter/material.dart';

class SunnahInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sunnah Information'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Sunnah Foods'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SunnahFoodsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Sunnah Eating Habits'),
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
        title: Text('Sunnah Foods'),
      ),
      body: Center(
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
        title: Text('Sunnah Eating Habits'),
      ),
      body: Center(
        child: Text('This is the Sunnah Eating Habits page'),
      ),
    );
  }
}
