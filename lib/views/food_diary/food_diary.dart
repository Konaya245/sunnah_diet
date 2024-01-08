import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunnah_diet/services/nsda_api.dart';
import 'package:sunnah_diet/models/search_model.dart';
import 'package:sunnah_diet/services/preferences_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sunnah_diet/services/auth.dart';
import 'package:sunnah_diet/views/food_diary/food_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

double progress = 0.0;

class FoodDiaryScreen extends StatefulWidget {
  const FoodDiaryScreen({super.key});

  @override
  State<FoodDiaryScreen> createState() => _FoodDiaryScreenState();
}

class _FoodDiaryScreenState extends State<FoodDiaryScreen> {
  // bool isPlannerMode = false;
  DateTime selectedDate = DateTime.now();
  int maxCalories = 2000;
  int breakfastCalories = 0;
  int lunchCalories = 0;
  int dinnerCalories = 0;
  int consumedCalories = 0;
  int remainingCalories = 0;

  late final String currentUserId;

  late final PreferencesService _prefsService;
  final User? user = Auth().currentUser;
  Future<FoodSearch>? _searchFuture;

  @override
  void initState() {
    super.initState();
    currentUserId = user?.uid ?? '0';
    _prefsService = PreferencesService(
        currentUserId); // Replace 'userId' with the actual user ID
    _loadMaxCalories();
  }

  void _loadMaxCalories() async {
    maxCalories = await _prefsService.getMaxCalories();
    setState(() {});
  }

  void changeCalories(int newMaxCalories) async {
    await _prefsService.setMaxCalories(newMaxCalories);
    setState(() {
      maxCalories = newMaxCalories;
    });
  }

  void addFoodItem(String currentMeal) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                onSubmitted: (String query) {
                  setState(() {
                    _searchFuture = searchFood(query);
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Search for a food',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              Expanded(
                child: FutureBuilder<FoodSearch>(
                  future: _searchFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('An error occurred. Please try again.'),
                      );
                    } else {
                      if (snapshot.data?.foods?.isEmpty ?? true) {
                        return const Center(
                          child: Text(
                              'No results found. Please enter a valid search term.'),
                        );
                      } else {
                        return ListView.separated(
                          itemCount: snapshot.data?.foods?.length ?? 0,
                          separatorBuilder: (context, index) {
                            if (index < snapshot.data!.foods!.length - 1 &&
                                (dataTypeEnumValues.reverse[snapshot.data!.foods![index].dataType] ==
                                        "Experimental" ||
                                    dataTypeEnumValues.reverse[snapshot.data!.foods![index].dataType] ==
                                        "SR Legacy" ||
                                    dataTypeEnumValues.reverse[snapshot
                                            .data!.foods![index].dataType] ==
                                        null ||
                                    dataTypeEnumValues.reverse[snapshot.data!
                                            .foods![index + 1].dataType] ==
                                        "Experimental" ||
                                    dataTypeEnumValues.reverse[snapshot.data!
                                            .foods![index + 1].dataType] ==
                                        "SR Legacy" ||
                                    dataTypeEnumValues.reverse[snapshot.data!
                                            .foods![index + 1].dataType] ==
                                        null)) {
                              return Container();
                            } else {
                              return const Divider(color: Colors.grey);
                            }
                          },
                          itemBuilder: (context, index) {
                            if (dataTypeEnumValues.reverse[snapshot
                                        .data!.foods![index].dataType] ==
                                    "Experimental" ||
                                dataTypeEnumValues.reverse[snapshot
                                        .data!.foods![index].dataType] ==
                                    "SR Legacy" ||
                                dataTypeEnumValues.reverse[snapshot
                                        .data!.foods![index].dataType] ==
                                    null) {
                              return Container(); // or any other widget you prefer
                            } else {
                              return ListTile(
                                title: Text(
                                    snapshot.data!.foods![index].description ??
                                        ''),
                                subtitle: Text(
                                    snapshot.data!.foods![index].brandName ??
                                        ''),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FoodDetailPage(
                                        food: snapshot.data!.foods![index],
                                        currentMeal: currentMeal,
                                        selectedDate: selectedDate,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    ).then((_) {
      setState(() {});
    });
  }

  void selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
      //doesn't consider the calories of selected date
    });
  }

  String getFormattedDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final yesterday = today.subtract(const Duration(days: 1));

    final inputDate = DateTime(date.year, date.month, date.day);

    if (inputDate == today) {
      return 'Today';
    } else if (inputDate == tomorrow) {
      return 'Tomorrow';
    } else if (inputDate == yesterday) {
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
                setState(() {});
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
    consumedCalories = breakfastCalories + lunchCalories + dinnerCalories;
    remainingCalories = maxCalories - consumedCalories;
    double progress = (consumedCalories / maxCalories).clamp(0.0, 1.0);

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
                  getFormattedDate(selectedDate),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold), // Format the date as needed
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
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Calories Remaining:',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$consumedCalories/$maxCalories kcal',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              iconSize: 16,
                              onPressed: openMaxCaloriesDialog,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Progress Indicator

                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 8, right: 8, left: 8),
                    child: LinearProgressIndicator(
                      value: progress,
                      color: Colors
                          .green, // Calculate the progress based on consumed calories
                      minHeight: 40,
                    ),
                  ),
                ],
              ),
            ),
            // Meal Boxes

            // Breakfast
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
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Breakfast:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$breakfastCalories kcal',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    buildMealList('breakfast'),
                    GestureDetector(
                      onTap: () => addFoodItem('breakfast'),
                      child: const Text('+ ADD FOOD',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),

            // Lunch
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
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Lunch:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$lunchCalories kcal',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    buildMealList('lunch'),
                    GestureDetector(
                      onTap: () => addFoodItem('lunch'),
                      child: const Text('+ ADD FOOD',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),

            // Dinner
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
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Dinner:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$dinnerCalories kcal',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    buildMealList('dinner'),
                    GestureDetector(
                      onTap: () => addFoodItem('dinner'),
                      child: const Text('+ ADD FOOD',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     setState(() {
            //       isPlannerMode = !isPlannerMode;
            //     });
            //   },
            //   child: Container(
            //     margin: const EdgeInsets.all(16),
            //     padding: const EdgeInsets.only(
            //       left: 16,
            //       right: 16,
            //       top: 12,
            //       bottom: 12,
            //     ),
            //     decoration: BoxDecoration(
            //       color: Colors.green,
            //       borderRadius: BorderRadius.circular(100),
            //     ),
            //     child: const Text('Planner Mode',
            //         style: TextStyle(color: Colors.white)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildMealList(String mealTime) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('user_diary').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        // Filter the documents by userId, dateTime, and mealTime
        var documents = snapshot.data!.docs.where((doc) {
          var data = doc.data() as Map<String, dynamic>;
          if (data['dateTime'] != null) {
            var docDate = data['dateTime'].toDate();
            var docDateOnly =
                DateTime(docDate.year, docDate.month, docDate.day);
            var selectedDateOnly = DateTime(
                selectedDate.year, selectedDate.month, selectedDate.day);
            return data['userId'] == currentUserId &&
                docDateOnly == selectedDateOnly &&
                data['mealTime'] == mealTime;
          } else {
            return false;
          }
        }).toList();

        // Calculate the total calories for the given meal time
        int totalCalories = documents.fold(0, (total, doc) {
          var data = doc.data() as Map<String, dynamic>;
          double calories =
              data['calories'] ?? 0.0; // Use 0.0 if calories is null
          return total +
              calories.round(); // Convert calories to int before adding
        });

        // Update the appropriate state variable
        if (mealTime == 'breakfast') {
          breakfastCalories = totalCalories;
        } else if (mealTime == 'lunch') {
          lunchCalories = totalCalories;
        } else if (mealTime == 'dinner') {
          dinnerCalories = totalCalories;
        }

        return SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var doc = documents[index];
              var data = doc.data() as Map<String, dynamic>;

              return Dismissible(
                key: Key(doc.id),
                onDismissed: (direction) {
                  setState(() {
                    var dismissedItemCalories =
                        (data['calories'] as num).round();
                    if (mealTime == 'breakfast') {
                      breakfastCalories -= dismissedItemCalories;
                    } else if (mealTime == 'lunch') {
                      lunchCalories -= dismissedItemCalories;
                    } else if (mealTime == 'dinner') {
                      dinnerCalories -= dismissedItemCalories;
                    }
                  });
                  FirebaseFirestore.instance
                      .collection('user_diary')
                      .doc(doc.id)
                      .delete();
                },
                child: InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => FoodDetailPage(
                  //         food: data,
                  //         currentMeal: mealTime,
                  //       ),
                  //     ),
                  //   );
                  // },
                  child: ListTile(
                    title: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          '${data['foodName']} ${(data['brandName'] ?? '').isEmpty ? '' : '(${data['brandName']})'}',
                          style: const TextStyle(fontSize: 14),
                        ), // Display the brand name along with the food name
                        if (data['isSunnahFood'] == true)
                          const Icon(
                            Icons.star,
                            color: Colors.green,
                            size: 20, // Adjust the size as needed
                          ),
                      ],
                    ),
                    trailing: Text('${data['calories']} kcal'),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
