import 'package:flutter/material.dart';

class NoInternetConnectionApp extends StatelessWidget {
  const NoInternetConnectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
              'No internet connection. Please connect to the internet and restart the app.'),
        ),
      ),
    );
  }
}

class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('An error occurred. Please restart the app.'),
        ),
      ),
    );
  }
}
