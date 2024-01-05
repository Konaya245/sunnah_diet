import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SunnahHabits extends StatelessWidget {
  const SunnahHabits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunnah Eating Habits'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const ListTile(
            title: Text(
              'These are the some of the eating habits practiced by Muslims around the globe, following the ways of the Prophet Muhammad (PBUH)',
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
                  .collection('sunnah_habits')
                  .orderBy('title')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                return ListView(
                  children: snapshot.data!.docs.asMap().entries.map((entry) {
                    int index = entry.key;
                    DocumentSnapshot document = entry.value;
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(data['source']),
                              content: Text(data['sourceinfo']),
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
                      child: ListTile(
                        leading: Text('${index + 1}'),
                        title: Text(data['title']),
                        subtitle: Text(data['description']),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          const ListTile(
            leading:
                Icon(Icons.info, size: 20), // Set the desired size for the icon
            title: Text(
              'Tap on a habit to view its source',
              style: TextStyle(
                  fontSize: 14), // Set the desired font size for the text
            ),
          ),
        ],
      ),
    );
  }
}

// class Habit {
//   final String title;
//   final String description;

//   Habit(this.title, this.description);
// }

// final List<Habit> habits = [
//   Habit('Praying Fajr', 'Praying the dawn prayer'),
//   Habit('Eating with Right Hand', 'Eating with the right hand'),
//   Habit('Using Miswak', 'Using a tooth-stick for oral hygiene'),
//   // Add more habits here
// ];
