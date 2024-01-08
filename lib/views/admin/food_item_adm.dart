import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodItemAdmin extends StatefulWidget {
  const FoodItemAdmin({super.key});

  @override
  State<FoodItemAdmin> createState() => _FoodItemAdminState();
}

class _FoodItemAdminState extends State<FoodItemAdmin> {
  bool _isAddingItem = false;
  bool _isEditingItem = false;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageController;
  late TextEditingController _sourceController;
  late TextEditingController _sourceInfoController;

  DocumentSnapshot?
      _selectedFoodItem; // Added variable to store the selected food item

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _imageController = TextEditingController();
    _sourceController = TextEditingController();
    _sourceInfoController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imageController.dispose();
    _sourceController.dispose(); // Add this line
    _sourceInfoController.dispose();
    super.dispose();
  }

  void _addItem() {
    setState(() {
      _nameController.text = '';
      _descriptionController.text = '';
      _imageController.text = '';
      _sourceController.text = ''; // Add this line
      _sourceInfoController.text = '';
    });
  }

  void _editItem(DocumentSnapshot foodItem) {
    setState(() {
      _isEditingItem = true;
      _selectedFoodItem = foodItem; // Store the selected food item
      _nameController.text = foodItem['name'];
      _descriptionController.text = foodItem['desc'];
      _imageController.text = foodItem['image'];
      _sourceController.text = foodItem['source']; // Add this line
      _sourceInfoController.text = foodItem['sourceinfo'];
    });
  }

  void _saveItem() {
    if (_isEditingItem && _selectedFoodItem != null) {
      // Update the item in Firestore
      FirebaseFirestore.instance
          .collection('food-items')
          .doc(_selectedFoodItem!.id)
          .update({
        'name': _nameController.text,
        'desc': _descriptionController.text,
        'image': _imageController.text,
        'source': _sourceController.text, // Add this line
        'sourceinfo': _sourceInfoController.text,
      });
    } else {
      // Save the item to Firestore
      FirebaseFirestore.instance.collection('food-items').add({
        'name': _nameController.text,
        'desc': _descriptionController.text,
        'image': _imageController.text,
        'source': _sourceController.text, // Add this line
        'sourceinfo': _sourceInfoController.text,
      });
    }

    setState(() {
      _isAddingItem = false;
      _isEditingItem = false;
      _selectedFoodItem = null; // Reset the selected food item
    });
  }

  void _deleteItem(DocumentSnapshot foodItem) {
    // Delete the item from Firestore
    FirebaseFirestore.instance
        .collection('food-items')
        .doc(foodItem.id)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunnah Foods Admin'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('Long tap on a sunnah food card to edit its contents',
                style: TextStyle(fontSize: 14)),
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

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot foodItem = snapshot.data!.docs[index];
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title:
                                  Text(foodItem['source'] ?? 'Source is empty'),
                              content: Text(foodItem['sourceinfo'] ??
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
                      onLongPress: () => _editItem(foodItem),
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/${foodItem['image']}',
                              width: 100, // Set the desired width
                              height: 100, // Set the desired height
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                // Return a Text widget if the image doesn't exist
                                return const Center(child: Text('Null image'));
                              },
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  foodItem['name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                subtitle: Text(
                                  foodItem['desc'],
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () => _deleteItem(foodItem),
                                    ),
                                  ],
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
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(
                labelText: 'Image',
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
      ),
    );
  }

  Widget _buildEditItemForm() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(
                labelText: 'Image',
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
      ),
    );
  }
}
