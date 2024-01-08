import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sunnah_diet/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  double _bmiResult = 0.0;
  String _bmiStatus = '';
  User? user = Auth().currentUser;
  late final String currentUserId;
  int _totalTracked = 0;
  String _favoriteFoodItem = 'None';

  @override
  void initState() {
    super.initState();
    currentUserId = user?.uid ?? '0';
    getTotalTracked().then((total) {
      setState(() {
        _totalTracked = total;
      });
    });
    getFavoriteFoodItem().then((favoriteFoodItem) {
      setState(() {
        _favoriteFoodItem = favoriteFoodItem;
      });
    });
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _nameController.dispose();
    // Don't forget to dispose of the controller when it's no longer needed
    super.dispose();
  }

  Future<void> updateUserName(String name) async {
    await user?.updateDisplayName(name);
    // After the profile update, make sure to refresh the user data
    await user?.reload();
    user = FirebaseAuth.instance.currentUser;
    setState(() {});
  }

  Future<int> getTotalTracked() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user_diary')
        .where('userId', isEqualTo: currentUserId)
        .where('isSunnahFood', isEqualTo: true)
        .get();

    return querySnapshot.size;
  }

  Future<String> getFavoriteFoodItem() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user_diary')
        .where('userId', isEqualTo: currentUserId)
        .where('isSunnahFood', isEqualTo: true)
        .get();

    if (querySnapshot.docs.isEmpty) {
      return 'None';
    }

    Map<String, int> foodCounts = {};
    for (var doc in querySnapshot.docs) {
      String foodItem = doc['foodName'];
      if (foodCounts.containsKey(foodItem)) {
        foodCounts[foodItem] = (foodCounts[foodItem] ?? 0) + 1;
      } else {
        foodCounts[foodItem] = 1;
      }
    }

    String favoriteFoodItem = foodCounts.keys.first;
    int maxCount = foodCounts.values.first;
    foodCounts.forEach((foodItem, count) {
      if (count > maxCount) {
        favoriteFoodItem = foodItem;
        maxCount = count;
      }
    });

    return favoriteFoodItem;
  }

  Widget _userProfile() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 54.0,
            backgroundColor: Colors.green,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/default_profile.png'),
              radius: 50.0,
            ),
          ),
          const SizedBox(height: 3.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
              TextButton(
                child: const Text('Edit'),
                onPressed: () async {
                  String? newName = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Enter new username'),
                        content: TextField(
                          controller: _nameController,
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop(_nameController.text);
                            },
                          ),
                        ],
                      );
                    },
                  );
                  if (newName != null) {
                    await updateUserName(newName);
                    setState(() {}); // Refresh the UI
                  }
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sunnah Foods',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14.0), // Add some space between the texts
          Text(
            'Total Tracked: $_totalTracked',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 8.0), // Add some space between the texts
          const Text(
            'Average Consumed: 1',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 8.0), // Add some space between the texts
          Text(
            'Favorite Food Item: ${toTitleCase(_favoriteFoodItem)}',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  String toTitleCase(String text) {
    if (text.isEmpty) {
      return text;
    }

    return text.split(' ').map((word) {
      if (word.isEmpty) {
        return word;
      }
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
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
