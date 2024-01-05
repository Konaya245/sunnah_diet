import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportIssuePage extends StatefulWidget {
  const ReportIssuePage({super.key});

  @override
  State<ReportIssuePage> createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _issueController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.isEmpty
          ? 'anonymous@email.com'
          : _emailController.text;
      DateTime now = DateTime.now();
      print('Current date and time: $now'); // Add this line
      FirebaseFirestore.instance.collection('issues').add({
        'email': email,
        'issue': _issueController.text,
        'date': now,
      });
      _emailController.clear();
      _issueController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
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
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _issueController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the issue';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Enter your email (optional)',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF034620),
                  ),
                  child: const Text('Submit',
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 48.0),
                const Text(
                  'Additional Contacts:',
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 12.0),
                const Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 8.0),
                    Text('support@sunnah-diet.com'),
                  ],
                ),
                const SizedBox(height: 10.0),
                const Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 8.0),
                    Text('+1234567890'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
