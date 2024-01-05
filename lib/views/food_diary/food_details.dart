import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sunnah_diet/models/foods/bastard_model.dart';
import 'package:sunnah_diet/models/search_model.dart';
import 'package:sunnah_diet/services/auth.dart';
import 'package:sunnah_diet/services/nsda_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  final String currentMeal;

  const FoodDetailPage(
      {super.key, required this.food, required this.currentMeal});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
  // ...
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  late final String currentUserId;
  double? calories;
  String? unit;
  late Future<BrandedFood> _foodDataFuture;
  final User? user = Auth().currentUser;

  @override
  void initState() {
    super.initState();
    if (widget.food.fdcId == null) {
      throw ArgumentError('fdcId cannot be null');
    }
    if (widget.food.fdcId != null) {
      _foodDataFuture = fetchData(widget.food.fdcId!);
    }
    currentUserId = user?.uid ?? '0';
  }

  void addFoodToDiary() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text(
              'Are you sure you want to add this food to your diary?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () async {
                Navigator.of(context).pop();

// Define a list of Sunnah food related words
                List<String> sunnahFoods = [
                  'dates',
                  'honey',
                  'olive',
                  'barley',
                  'grapes',
                  'figs',
                  'black seed',
                  'pomegranate',
                  'banana',
                  'habbatus sauda',
                  'habatussauda',
                  'pumpkin',
                  'cucumber',
                  'watermelon',
                  'melon',
                ];

// Check if foodName contains any Sunnah food related words
                bool isSunnahFood = sunnahFoods.any((food) =>
                    widget.food.description!.toLowerCase().contains(food));

                // Get the current date and time
                DateTime now = DateTime.now();

                // Save the data to Firestore
                await FirebaseFirestore.instance.collection('user_diary').add({
                  'userId': currentUserId,
                  'foodId': widget.food.fdcId,
                  'foodName': widget.food.description,
                  'brandName': widget.food.brandName,
                  'calories': calories,
                  'dateTime': now,
                  'mealTime': widget.currentMeal,
                  'isSunnahFood': isSunnahFood,
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Details'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<BrandedFood>(
              future: _foodDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Column(
                    children: [
                      ListTile(
                        title: Text('${snapshot.data!.description}'),
                        subtitle: Text(
                            'Brand: ${snapshot.data!.brandName ?? 'Unknown'}'),
                        trailing: DropdownButton<String>(
                          hint: const Text(
                            '100g',
                            style: TextStyle(fontSize: 18),
                          ),
                          items: <String>['100g', '', ''].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {
                            // Handle the selected portion here
                          },
                        ),
                      ),
                      snapshot.data!.foodNutrients != null
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: snapshot.data!.foodNutrients!.length,
                                itemBuilder: (context, index) {
                                  // Assign the values to the variables
                                  if (snapshot.data!.foodNutrients![index]
                                          .nutrient?.name ==
                                      'Energy') {
                                    calories = snapshot
                                        .data!.foodNutrients![index].amount;
                                    unit = snapshot.data!.foodNutrients![index]
                                        .nutrient?.unitName;
                                  }
                                  return ListTile(
                                    title: Text(
                                        '${snapshot.data!.foodNutrients![index].nutrient?.name}'),
                                    subtitle: Text(
                                        'Amount: ${snapshot.data!.foodNutrients![index].amount} ${snapshot.data!.foodNutrients![index].nutrient?.unitName}'),
                                  );
                                },
                              ),
                            )
                          : const Center(child: Text('No nutrients data')),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addFoodToDiary,
        child: const Icon(Icons.add),
      ),
    );
  }

  // ...
}
