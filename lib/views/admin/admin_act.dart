import 'package:flutter/material.dart';
import 'package:sunnah_diet/views/admin/food_item_adm.dart';
import 'package:sunnah_diet/views/admin/sunnah_info_adm.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FoodItemAdmin(),
                  ),
                );
              },
              child: const Text('Food Item Admin'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SunnahInfoAdmin(),
                  ),
                );
              },
              child: const Text('Sunnah Info Admin'),
            ),
          ],
        ),
      ),
    );
  }
}
