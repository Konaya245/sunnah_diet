import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FoodDiaryScreen extends StatefulWidget {
  const FoodDiaryScreen({super.key});

  @override
  State<FoodDiaryScreen> createState() => _FoodDiaryScreenState();
}

class _FoodDiaryScreenState extends State<FoodDiaryScreen> {
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
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
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
                        SizedBox(
                          width: 100,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: maxCalories.toString(),
                            ),
                            onChanged: (value) {
                              changeCalories(int.parse(value));
                            },
                          ),
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
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('Breakfast: $breakfastCalories cal'),
                  const SizedBox(height: 8),
                  Text('Lunch: $lunchCalories cal'),
                  const SizedBox(height: 8),
                  Text('Dinner: $dinnerCalories cal'),
                ],
              ),
            ),
            // Add Food Button
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Add food'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: addFoodItem,
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
