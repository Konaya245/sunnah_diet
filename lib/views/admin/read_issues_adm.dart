import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ReadIssuesAdmin extends StatefulWidget {
  const ReadIssuesAdmin({super.key});

  @override
  State<ReadIssuesAdmin> createState() => _ReadIssuesAdminState();
}

class _ReadIssuesAdminState extends State<ReadIssuesAdmin> {
  late CollectionReference<Map<String, dynamic>> _issuesCollection;

  @override
  void initState() {
    super.initState();
    _issuesCollection = FirebaseFirestore.instance.collection('issues');
  }

  Future<void> _deleteIssue(String docId) async {
    await _issuesCollection.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Issues Admin'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _issuesCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          final issues = snapshot.data?.docs;

          return ListView.builder(
            itemCount: issues?.length,
            itemBuilder: (context, index) {
              final issue = issues?[index].data();
              final email = issue?['email'];
              final issueText = issue?['issue'];
              final date = issue?['date']
                  as Timestamp?; // Retrieve the date, which might be null
              final formattedDate = date != null
                  ? DateFormat('dd/MM/yyyy')
                      .format(date.toDate()) // Format the date if it's not null
                  : 'date field is empty'; // Otherwise, show 'Date is empty'

              return Card(
                child: ListTile(
                  title: Text('Issue: $issueText'),
                  subtitle: Text('From: $email, Submitted: $formattedDate'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _deleteIssue(issues![index].id);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
