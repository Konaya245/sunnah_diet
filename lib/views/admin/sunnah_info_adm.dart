import 'package:flutter/material.dart';

class SunnahInfoAdmin extends StatelessWidget {
  const SunnahInfoAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunnah Info Admin'),
      ),
      body: const Center(
        child: Text('This is the Sunnah Info Admin Page'),
      ),
    );
  }
}
