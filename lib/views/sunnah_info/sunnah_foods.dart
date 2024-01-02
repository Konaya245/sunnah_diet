import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SunnahFoodsPage extends StatelessWidget {
  const SunnahFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunnah Foods'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('food-items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final sunnahFoodItems = snapshot.data!.docs
              .where((foodItem) => foodItem['isSunnahFood'] == true)
              .toList();

          return ListView.builder(
            itemCount: sunnahFoodItems.length,
            itemBuilder: (context, index) {
              DocumentSnapshot foodItems = sunnahFoodItems[index];
              return Card(
                elevation: 4.0,
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/${foodItems['image']}',
                      width: 200, // Set the desired width
                      height: 200, // Set the desired height
                    ),
                    ListTile(
                      title: Text(
                        foodItems['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      subtitle: Text(
                        foodItems['desc'],
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      trailing: const Text(
                        'Sunnah Food',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
