import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SunnahFoodsPage extends StatelessWidget {
  const SunnahFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunnah Foods'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          const ListTile(
            title: Text(
              'These are the some of the foods mentioned in the Quran or Hadith, for its miraculous benefits to the human body.',
              style: TextStyle(fontSize: 14),
              // Set the desired font size for the text
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Colors.black38,
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('food-items')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final sunnahFoodItems = snapshot.data!.docs.toList();

                return ListView.builder(
                  itemCount: sunnahFoodItems.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot foodItems = sunnahFoodItems[index];
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                  foodItems['source'] ?? 'Source is empty'),
                              content: Text(foodItems['sourceinfo'] ??
                                  'Source info is empty'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Card(
                        elevation: 4.0,
                        margin: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100, // Set the desired width
                              height: 100, // Set the desired height
                              child: Image.asset(
                                'assets/images/${foodItems['image']}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: ListTile(
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const ListTile(
            leading:
                Icon(Icons.info, size: 20), // Set the desired size for the icon
            title: Text(
              'Tap on a sunnah food to view its source',
              style: TextStyle(
                  fontSize: 14), // Set the desired font size for the text
            ),
          ),
        ],
      ),
    );
  }
}
