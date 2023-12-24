import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Account Management'),
            onTap: () {
              // Navigate to the account management page
              Navigator.pushNamed(context, 'settings/account_management');
            },
          ),
          ListTile(
            title: const Text('Notification'),
            onTap: () {
              // Navigate to the notification page
              Navigator.pushNamed(context, 'settings/notification');
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              // Navigate to the privacy policy page
              Navigator.pushNamed(context, 'settings/privacy_policy');
            },
          ),
          ListTile(
            title: const Text('Terms and Conditions'),
            onTap: () {
              // Navigate to the terms and conditions page
              Navigator.pushNamed(context, 'settings/terms_and_conditions');
            },
          ),
          ListTile(
            title: const Text('Report an Issue'),
            onTap: () {
              // Navigate to the report an issue page
              Navigator.pushNamed(context, 'settings/report_issue');
            },
          ),
        ],
      ),
    );
  }
}
