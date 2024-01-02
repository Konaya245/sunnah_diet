import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FoodDiaryScreen extends StatefulWidget {
  const FoodDiaryScreen({super.key});

  @override
  State<FoodDiaryScreen> createState() => _FoodDiaryScreenState();
}

class _FoodDiaryScreenState extends State<FoodDiaryScreen> {
  bool isPlannerMode = false;
  DateTime selectedDate = DateTime.now();
  int maxCalories = 2000;
  int breakfastCalories = 0;
  int lunchCalories = 0;
  int dinnerCalories = 0;
  int consumedCalories = 0;

  void selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void changeCalories(int newMaxCalories) {
    setState(() {
      maxCalories = newMaxCalories;
    });
  }

  void addFoodItem() {
    // Implement the logic to add a food item
  }

  String getFormattedDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final yesterday = today.subtract(const Duration(days: 1));

    if (date == today) {
      return 'Today';
    } else if (date == tomorrow) {
      return 'Tomorrow';
    } else if (date == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('EEEE, d MMM').format(date);
    }
  }

  void openMaxCaloriesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int newMaxCalories = maxCalories;

        return AlertDialog(
          title: const Text('Set Max Calories'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              newMaxCalories = int.tryParse(value) ?? maxCalories;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                changeCalories(newMaxCalories);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Date Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_left),
                  onPressed: () {
                    selectDate(selectedDate.subtract(const Duration(days: 1)));
                  },
                ),
                Text(
                  getFormattedDate(selectedDate), // Format the date as needed
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_right),
                  onPressed: () {
                    selectDate(selectedDate.add(const Duration(days: 1)));
                  },
                ),
              ],
            ),
            // Progress Bar
            Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Max Calories
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Calories Remaining:'),
                        Row(
                          children: [
                            Text(
                              maxCalories.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: openMaxCaloriesDialog,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Progress Indicator
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const LinearProgressIndicator(
                      value: 0.5,
                      color: Colors
                          .green, // Calculate the progress based on consumed calories
                      minHeight: 30,
                    ),
                  ),
                ],
              ),
            ),
            // Meal Boxes

            // Add Food Button
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Breakfast: $breakfastCalories cal'),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: addFoodItem,
                      child: const Text('+ Add food'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Lunch: $lunchCalories cal'),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: addFoodItem,
                      child: const Text('+ Add food'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Dinner: $dinnerCalories cal'),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: addFoodItem,
                      child: const Text('+ Add food'),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isPlannerMode = !isPlannerMode;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 12,
                  bottom: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text('Planner Mode',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
