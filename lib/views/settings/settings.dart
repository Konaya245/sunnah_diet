import 'package:flutter/material.dart';
import 'package:sunnah_diet/views/settings/privacy_policy.dart';
import 'package:sunnah_diet/views/settings/terms_and_conditions.dart';
import 'package:sunnah_diet/views/settings/notification.dart';
import 'package:sunnah_diet/views/settings/account_management.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: ListTile(
              title: const Text('Account Management'),
              onTap: () {
                // Navigate to the account management page
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AccountManagementPage();
                }));
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: ListTile(
              title: const Text('Notification'),
              onTap: () {
                // Navigate to the notification page
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const NotificationScreen();
                }));
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: ListTile(
              title: const Text('Privacy Policy'),
              onTap: () {
                // Navigate to the notification page
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PrivacyPolicyPage();
                }));
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: ListTile(
              title: const Text('Terms and Conditions'),
              onTap: () {
                // Navigate to the notification page
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TermsAndConditionsPage();
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
