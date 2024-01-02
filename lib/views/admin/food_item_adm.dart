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
  bool _isSunnahFood = false;
  DocumentSnapshot?
      _selectedFoodItem; // Added variable to store the selected food item

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _imageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void _addItem() {
    setState(() {
      _isAddingItem = true;
      _nameController.text = '';
      _descriptionController.text = '';
      _imageController.text = '';
      _isSunnahFood = false;
    });
  }

  void _editItem(DocumentSnapshot foodItem) {
    setState(() {
      _isEditingItem = true;
      _selectedFoodItem = foodItem; // Store the selected food item
      _nameController.text = foodItem['name'];
      _descriptionController.text = foodItem['desc'];
      _imageController.text = foodItem['image'];
      _isSunnahFood = foodItem['isSunnahFood'];
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
        'isSunnahFood': _isSunnahFood,
      });
    } else {
      // Save the item to Firestore
      FirebaseFirestore.instance.collection('food-items').add({
        'name': _nameController.text,
        'desc': _descriptionController.text,
        'image': _imageController.text,
        'isSunnahFood': _isSunnahFood,
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
        title: const Text('Food Items Admin'),
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

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot foodItem = snapshot.data!.docs[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/${foodItem['image']}',
                      width: 200, // Set the desired width
                      height: 200, // Set the desired height
                    ),
                    ListTile(
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
                            icon: const Icon(Icons.edit),
                            onPressed: () => _editItem(foodItem),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteItem(foodItem),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItem();
          _isAddingItem = true;
        },
        child: const Icon(Icons.add),
      ),
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
          Row(
            children: [
              Checkbox(
                value: _isSunnahFood,
                onChanged: (value) {
                  setState(() {
                    _isSunnahFood = value ?? false;
                  });
                },
              ),
              const Text('Is Sunnah Food'),
            ],
          ),
          ElevatedButton(
            onPressed:
                _saveItem, // Call _saveItem without passing any arguments
            child: const Text('Save'),
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
          Row(
            children: [
              Checkbox(
                value: _isSunnahFood,
                onChanged: (value) {
                  setState(() {
                    _isSunnahFood = value ?? false;
                  });
                },
              ),
              const Text('Is Sunnah Food'),
            ],
          ),
          ElevatedButton(
            onPressed:
                _saveItem, // Call _saveItem without passing any arguments
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
