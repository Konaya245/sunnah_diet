import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SunnahInfoAdmin extends StatefulWidget {
  const SunnahInfoAdmin({super.key});

  @override
  State<SunnahInfoAdmin> createState() => _SunnahInfoAdminState();
}

class _SunnahInfoAdminState extends State<SunnahInfoAdmin> {
  bool _isAddingItem = false;
  bool _isEditingItem = false;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _sourceController;
  late TextEditingController _sourceInfoController;

  DocumentSnapshot?
      _selectedhabitItem; // Added variable to store the selected food item

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _sourceController = TextEditingController();
    _sourceInfoController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _sourceController.dispose(); // Add this line
    _sourceInfoController.dispose();
    super.dispose();
  }

  void _addItem() {
    setState(() {
      _titleController.text = '';
      _descriptionController.text = '';

      _sourceController.text = ''; // Add this line
      _sourceInfoController.text = '';
    });
  }

  void _editItem(DocumentSnapshot habitItem) {
    setState(() {
      _isEditingItem = true;
      _selectedhabitItem = habitItem; // Store the selected food item
      _titleController.text = habitItem['title'];
      _descriptionController.text = habitItem['description'];

      _sourceController.text = habitItem['source']; // Add this line
      _sourceInfoController.text = habitItem['sourceinfo'];
    });
  }

  void _saveItem() {
    if (_isEditingItem && _selectedhabitItem != null) {
      // Update the item in Firestore
      FirebaseFirestore.instance
          .collection('sunnah_habits')
          .doc(_selectedhabitItem!.id)
          .update({
        'title': _titleController.text,
        'description': _descriptionController.text,

        'source': _sourceController.text, // Add this line
        'sourceinfo': _sourceInfoController.text,
      });
    } else {
      // Save the item to Firestore
      FirebaseFirestore.instance.collection('sunnah_habits').add({
        'title': _titleController.text,
        'description': _descriptionController.text,
        'source': _sourceController.text, // Add this line
        'sourceinfo': _sourceInfoController.text,
      });
    }

    setState(() {
      _isAddingItem = false;
      _isEditingItem = false;
      _selectedhabitItem = null; // Reset the selected food item
    });
  }

  void _deleteItem(DocumentSnapshot habitItem) {
    // Delete the item from Firestore
    FirebaseFirestore.instance
        .collection('sunnah_habits')
        .doc(habitItem.id)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunnah Eating Habits Admin'),
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
                    return Dismissible(
                      key: Key(document.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) async {
                        bool confirmDelete = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirm Delete'),
                                  content: const Text(
                                      'Are you sure you want to delete this item?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Delete'),
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDelete) {
                          _deleteItem(
                              document); // Delete the item from the database
                        } else {
                          // Reinsert the item into the list need to use listbuilder
                        }
                      },
                      child: InkWell(
                        onLongPress: () => _editItem(document),
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
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_isEditingItem) {
              _isEditingItem = false;
            } else {
              _addItem();
              _isAddingItem = !_isAddingItem;
            }
          });
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(
          _isAddingItem || _isEditingItem
              ? Icons.keyboard_arrow_down_sharp
              : Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomSheet: _isAddingItem
          ? _buildAddItemForm()
          : _isEditingItem
              ? _buildEditItemForm()
              : null,
    );
  }

  Widget _buildAddItemForm() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          TextField(
            controller: _sourceController,
            decoration: const InputDecoration(
              labelText: 'Source',
            ),
          ),
          TextField(
            controller: _sourceInfoController,
            decoration: const InputDecoration(
              labelText: 'Source Info',
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF034620)),
            onPressed:
                _saveItem, // Call _saveItem without passing any arguments
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildEditItemForm() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          TextField(
            controller: _sourceController,
            decoration: const InputDecoration(
              labelText: 'Source',
            ),
          ),
          TextField(
            controller: _sourceInfoController,
            decoration: const InputDecoration(
              labelText: 'Source Info',
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF034620)),
            onPressed:
                _saveItem, // Call _saveItem without passing any arguments
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
