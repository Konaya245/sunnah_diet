import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sunnah_diet/auth.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  final User? user = Auth().currentUser;

  Widget _title() {
    return const Text(
      'Sunnah Dieting App',
      style: TextStyle(
        color: Colors.green,
        decoration: TextDecoration.underline,
      ),
    );
  }

  Widget _userUid() {
    return Text(
      user?.email ?? 'User email',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _title(), backgroundColor: Colors.white, actions: [
        _userUid(),
        const SizedBox(width: 12),
      ]),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userUid(),
          ],
        ),
      ),
    );
  }
}
