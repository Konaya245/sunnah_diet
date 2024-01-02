import 'package:flutter/material.dart';
// import 'package:firebase/firebase.dart' as firebase;

class ReportIssuePage extends StatefulWidget {
  const ReportIssuePage({super.key});

  @override
  State<ReportIssuePage> createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {
  final TextEditingController _issueController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _submitIssue() {
    String issue = _issueController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

    // // Connect to Firebase and pass the issue
    // firebase.initializeApp(
    //   apiKey: "YOUR_API_KEY",
    //   authDomain: "YOUR_AUTH_DOMAIN",
    //   databaseURL: "YOUR_DATABASE_URL",
    //   projectId: "YOUR_PROJECT_ID",
    //   storageBucket: "YOUR_STORAGE_BUCKET",
    // );

    // // Save the issue to Firebase
    // firebase.database().ref("issues").push().set({
    //   "issue": issue,
    //   "email": email,
    //   "phone": phone,
    // });

    // Clear the text fields
    _issueController.clear();
    _emailController.clear();
    _phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Report an Issue',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'What seems to be the issue?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            TextField(
              controller: _issueController,
              maxLines: 5,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitIssue,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16.0),
            const Text('Additional Contacts:'),
            const Text('Email: your-email@example.com'),
            const Text('Phone: +1234567890'),
          ],
        ),
      ),
    );
  }
}
