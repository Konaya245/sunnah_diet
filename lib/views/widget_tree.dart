// Importing necessary packages and files
import 'package:sunnah_diet/services/auth.dart';
import 'package:sunnah_diet/views/authentication/login_register.dart';
import 'package:flutter/material.dart';
import 'package:sunnah_diet/views/nav_bar.dart';
import 'package:sunnah_diet/views/on_boarding/get_started.dart';

// Defining a StatefulWidget called WidgetTree
class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

// Defining the state for the WidgetTree
class _WidgetTreeState extends State<WidgetTree> {
  bool _getStartedViewed = false;

  @override
  Widget build(BuildContext context) {
    // Building the widget tree based on the authentication state
    return StreamBuilder(
      stream: Auth()
          .authStateChanges, // Listening to the authentication state changes
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // If user is authenticated, show the NavBar widget
          return const NavBar();
        } else {
          // Check if the "Get Started" page has been viewed
          if (!_getStartedViewed) {
            // If not, show the "Get Started" page
            return GetStartedPage(onFinished: () {
              // When the "Get Started" page is finished, set _getStartedViewed to true
              setState(() {
                _getStartedViewed = true;
              });
            });
          } else {
            // If the "Get Started" page has been viewed, show the "Login" page
            return const LoginPage();
          }
        }
      },
    );
  }
}
