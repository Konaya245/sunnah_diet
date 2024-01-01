import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ), // Add padding to the horizontal and vertical edges
        child: Column(
          children: [
            const Center(
              child: Text(
                '\nWelcome to the Sunnah Dieting App, your companion in embracing a healthy lifestyle rooted in the teachings of Sunnah. \n\n Our app is dedicated to providing you with a simple yet meaningful experience, guiding you towards a balanced and mindful approach to dieting.\n',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              color: Colors.green,
            ),
            Image.asset(
              'assets/images/logo-slogan.png',
              width: 220,
              height: 220,
            ),
            const Divider(
              color: Colors.green,
            ),
            const Text(
              '\nContact Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email_outlined),
                SizedBox(width: 8),
                Text(
                  'zaidi.razak@live.iium.edu.my',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email_outlined),
                SizedBox(width: 8),
                Text(
                  'mzaidi.ar@gmail.com',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
