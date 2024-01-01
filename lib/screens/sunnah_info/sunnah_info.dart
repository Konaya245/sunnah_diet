import 'package:flutter/material.dart';
import 'package:sunnah_diet/screens/sunnah_info/sunnah_foods.dart';
import 'package:sunnah_diet/screens/sunnah_info/sunnah_habits.dart';

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
              title: Text(
                  "Sunnah Diet is a diet based on the eating habits of Prophet Muhammad (peace be upon him). This diet includes wholesome, natural foods, and encourages specific etiquettes like mentioning Allah's name before meals and sharing food.  "),
            ),
          ]),
          const ExpansionTile(
              title: Text('Why follow a Sunnah Diet?'),
              children: [
                ListTile(
                  title: Text(
                      'The Sunnah Diet encourages mindful and balanced eating, promotes faith, fosters gratitude, and strengthens family/community bonds. It is a holistic approach for a healthier lifestyle suitable for all. '),
                ),
              ]),
          const ExpansionTile(
              title: Text('I am non-muslim, can I follow Sunnah Diet?'),
              children: [
                ListTile(
                  title: Text(
                      "The Sunnah Diet is not exclusive to Muslims, and anyone can adopt its principles for a healthier lifestyle. While rooted in Islamic teachings, the Sunnah diet's healthful aspects are applicable to people of all backgrounds."),
                ),
              ]),
          const ExpansionTile(
              title: Text('What are the Health benefits of Sunnah Dieting'),
              children: [
                ListTile(
                  title: Text(
                      "Through a balanced and mindful approach to eating, the Sunnah diet offers health benefits such as improved digestion, weight management, and a reduced risk of chronic diseases, including cardiovascular conditions and diabetes."),
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
                MaterialPageRoute(builder: (context) => const SunnahHabits()),
              );
            },
          ),
        ],
      ),
    );
  }
}
