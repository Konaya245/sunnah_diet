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
        child: const Column(
          children: [
            Center(
              child: Text(
                '\n\nWelcome to the Sunnah Dieting App, your companion in embracing a healthy lifestyle rooted in the teachings of Sunnah. \n\n Our app is dedicated to providing you with a simple yet meaningful experience, guiding you towards a balanced and mindful approach to dieting.\n\n',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              color: Colors.green,
            ),
            Text(
              '\nSunnah Dieting App\n',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Divider(
              color: Colors.green,
            ),
            Text(
              'Nourishing body and soul through Sunnah',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.green,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
