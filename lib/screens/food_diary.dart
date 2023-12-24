import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Diary'),
      ),
      body: Column(
        children: [
          // Date Selector
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_left),
                onPressed: () {
                  selectDate(selectedDate.subtract(Duration(days: 1)));
                },
              ),
              Text(
                selectedDate.toString(), // Format the date as needed
              ),
              IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {
                  selectDate(selectedDate.add(Duration(days: 1)));
                },
              ),
            ],
          ),
          // Progress Bar
          Container(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              value: 0.5, // Calculate the progress based on consumed calories
            ),
          ),
          // Max Calories
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Max Calories:'),
                SizedBox(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      changeCalories(int.parse(value));
                    },
                  ),
                ),
              ],
            ),
          ),
          // Meal Boxes
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Breakfast: $breakfastCalories cal'),
                SizedBox(height: 8),
                Text('Lunch: $lunchCalories cal'),
                SizedBox(height: 8),
                Text('Dinner: $dinnerCalories cal'),
              ],
            ),
          ),
          // Add Food Button
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Add food'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addFoodItem,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
