import 'package:flutter/material.dart';

class AccountManagementPage extends StatelessWidget {
  const AccountManagementPage({super.key});

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
            onTap: () {
              // Navigate to 'Change your password' page
            },
          ),
          ListTile(
            title: const Text('Export your data'),
            onTap: () {
              // Navigate to 'Export your data' page
            },
          ),
          ListTile(
            title: const Text('Delete your account'),
            onTap: () {
              // Navigate to 'Delete your account' page
            },
          ),
          ListTile(
            title: const Text('Sign Out'),
            onTap: () {
              // Perform sign out action
            },
          ),
        ],
      ),
    );
  }
}
