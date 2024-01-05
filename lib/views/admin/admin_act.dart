import 'package:flutter/material.dart';
import 'package:sunnah_diet/views/admin/food_item_adm.dart';
import 'package:sunnah_diet/views/admin/read_issues_adm.dart';
import 'package:sunnah_diet/views/admin/sunnah_info_adm.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          ListTile(
            title: const Text('Sunnah Foods Admin'),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FoodItemAdmin(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Sunnah Info Admin'),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SunnahInfoAdmin(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Read Issues Admin'),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReadIssuesAdmin(),
                ),
              );
            },
          ),
          // Add more ListTiles for other admin pages
        ],
      ),
    );
  }
}
