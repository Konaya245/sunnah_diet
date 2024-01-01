import 'package:flutter/material.dart';

class SunnahFoodsPage extends StatelessWidget {
  final List<Map<String, String>> sunnahFoods = [
    {
      'image': 'assets/images/dates.jpg',
      'name': 'Food 1',
      'description': 'Description 1',
    },
    {
      'image': 'assets/images/figs.jpg',
      'name': 'Food 2',
      'description': 'Description 2',
    },
    // Add more sunnah foods here
  ];

  SunnahFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunnah Foods'),
      ),
      body: ListView.builder(
        itemCount: sunnahFoods.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Image.asset(
                  sunnahFoods[index]['image']!,
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 8.0),
                Text(
                  sunnahFoods[index]['name']!,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  sunnahFoods[index]['description']!,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
