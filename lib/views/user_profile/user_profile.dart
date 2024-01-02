import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sunnah_diet/services/auth.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  final User? user = Auth().currentUser;

  Widget _userProfile() {
    return Column(
      children: [
        Text(
          'Username: ${user?.displayName ?? 'User name'}',
        ),
        Text(
          'Email: ${user?.email ?? 'User email'}',
        ),
      ],
    );
  }

  Widget _statisticsTab() {
    return const Column(
      children: [
        Text(
          'Sunnah Foods',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Total Tracked: 10',
        ),
        Text(
          'Average Consumed: 5',
        ),
        Text(
          'Favorite Food Item: Dates',
        ),
        SizedBox(height: 20),
        Text(
          'Calories',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Total Consumed (Lifetime): 1000',
        ),
        Text(
          'Daily Average Consumed: 50',
        ),
      ],
    );
  }

  Widget _bmiCalculatorTab() {
    return const Column(
      children: [
        Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Weight: 70 kg',
        ),
        Text(
          'Height: 170 cm',
        ),
        Text(
          'BMI: 24.2',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            _userProfile(),
            const SizedBox(height: 12),
            const TabBar(
              tabs: [
                Tab(text: 'Statistics'),
                Tab(text: 'BMI Calculator'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: _statisticsTab(),
                  ),
                  SingleChildScrollView(
                    child: _bmiCalculatorTab(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
