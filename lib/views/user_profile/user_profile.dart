import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sunnah_diet/services/auth.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  double _bmiResult = 0.0;
  String _bmiStatus = '';
  final User? user = Auth().currentUser;

  Widget _userProfile() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Username: ',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user?.displayName ?? 'User name',
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0), // Add some space between the texts
          Row(
            children: [
              const Text(
                'Email: ',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user?.email ?? 'User email',
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statisticsTab() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sunnah Foods',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14.0), // Add some space between the texts
          Text(
            'Total Tracked: 10',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 8.0), // Add some space between the texts
          Text(
            'Average Consumed: 5',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 8.0), // Add some space between the texts
          Text(
            'Favorite Food Item: Dates',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _bmiCalculatorTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'BMI Calculator',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight in kg',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your weight';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height in cm',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your height';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: _calculateBMI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF034620),
                ),
                child: const Text(
                  'Calculate BMI',
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(height: 16.0),
            Text(
              'Your BMI: ${_bmiResult.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Status: $_bmiStatus',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateBMI() {
    if (_formKey.currentState!.validate()) {
      final weight = double.parse(_weightController.text);
      final height = double.parse(_heightController.text) / 100;

      setState(() {
        _bmiResult = weight / (height * height);
        _bmiStatus = _getBMIStatus(_bmiResult);
      });
    }
  }

  String _getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
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
