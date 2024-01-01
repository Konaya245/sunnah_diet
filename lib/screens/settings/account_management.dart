import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AccountManagementPage extends StatelessWidget {
  const AccountManagementPage({super.key});

  Future<void> changePassword(BuildContext context) async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Prompt the user to enter a new password
    String? newPassword = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Password'),
          content: const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'New Password',
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    // Update the user's password
    if (newPassword != null) {
      await user?.updatePassword(newPassword);
      // Show a success message
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Password changed successfully')),
      );
    }
  }

  Future<void> exportData(BuildContext context) async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Get the user's data from Firestore
    DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    List<List<dynamic>> csvData = [
      ['Name', 'Email', 'Age'], // CSV header
      [
        userData['name'],
        userData['email'],
        userData['age'],
      ], // User data
    ];
    String csvString = const ListToCsvConverter().convert(csvData);

    // Request permission to write to external storage
    if (await Permission.storage.request().isGranted) {
      // Get the directory for storing the CSV file
      Directory? appDocumentsDirectory = await getExternalStorageDirectory();
      String csvFilePath = '${appDocumentsDirectory?.path}/user_data.csv';

      // Write the CSV string to a file
      File csvFile = File(csvFilePath);
      await csvFile.writeAsString(csvString);

      // Show a success message
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Data exported successfully')),
      );
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Delete the user's account
    await user?.delete();

    // Show a success message
    scaffoldMessenger.showSnackBar(
      const SnackBar(content: Text('Account deleted successfully')),
    );
  }

  Future<void> signOut(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    // Sign out the user
    await FirebaseAuth.instance.signOut();

    // Show a success message
    scaffoldMessenger.showSnackBar(
      const SnackBar(content: Text('Signed out successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Account Management',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Change your password'),
            onTap: () => changePassword(context),
          ),
          ListTile(
            title: const Text('Export your data'),
            onTap: () => exportData(context),
          ),
          ListTile(
            title: const Text('Delete your account'),
            onTap: () => deleteAccount(context),
          ),
          ListTile(
            title: const Text('Sign Out'),
            onTap: () => signOut(context),
          ),
        ],
      ),
    );
  }
}
