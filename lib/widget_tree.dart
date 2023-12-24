// Importing necessary packages and files
import 'package:sunnah_diet/auth.dart';
import 'package:sunnah_diet/screens/home_page.dart';
import 'package:sunnah_diet/screens/login_register.dart';
import 'package:flutter/material.dart';

// Defining a StatefulWidget called WidgetTree
class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

// Defining the state for the WidgetTree
class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    // Building the widget tree based on the authentication state
    return StreamBuilder(
      stream: Auth()
          .authStateChanges, // Listening to the authentication state changes
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // If user is authenticated, show the HomePage widget
          return HomePage();
        } else {
          // If user is not authenticated, show the LoginPage widget
          return LoginPage();
        }
      },
    );
  }
}
