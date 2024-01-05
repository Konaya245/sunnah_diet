import 'package:flutter/material.dart';
import 'package:sunnah_diet/views/sunnah_info/sunnah_foods.dart';
import 'package:sunnah_diet/views/sunnah_info/sunnah_habits.dart';

class SunnahInfoPage extends StatelessWidget {
  const SunnahInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const ListTile(
            title: Text(
              'Frequency Asked Questions (FAQs)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const ExpansionTile(title: Text('What is Sunnah Diet?'), children: [
            ListTile(
              title: Text(
                "Sunnah Diet is a diet based on the eating habits and etiquettes of Prophet Muhammad (pbuh). This diet includes wholesome, natural foods, and encourages specific etiquettes like invoking Allah's name before meals and sharing food.  ",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ]),
          const ExpansionTile(
              title: Text('Why follow a Sunnah Diet?'),
              children: [
                ListTile(
                  title: Text(
                    'The Sunnah Diet encourages mindful and balanced eating, promotes faith, fosters gratitude, and strengthens family/community bonds by following its recommended habits. It is a well-rounded approach for a healthier lifestyle suitable for all. ',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ]),
          const ExpansionTile(
              title: Text('I am non-muslim, can I follow Sunnah Diet?'),
              children: [
                ListTile(
                  title: Text(
                    "The Sunnah Diet is not exclusive to Muslims, and anyone can adopt its principles for a healthier lifestyle. While rooted in Islamic teachings, the Sunnah diet's healthful aspects are applicable to people of all backgrounds.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ]),
          const ExpansionTile(
              title: Text('What are the health benefits of Sunnah Dieting?'),
              children: [
                ListTile(
                  title: Text(
                    "Through a balanced and mindful approach to eating, the Sunnah diet offers health benefits such as improved digestion, weight management, and a reduced risk of chronic diseases, including cardiovascular conditions and diabetes.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ]),
          const SizedBox(height: 20),
          const ListTile(
            title: Text(
              'More Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text('Sunnah Foods'),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SunnahFoodsPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Sunnah Eating Etiquettes'),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
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
