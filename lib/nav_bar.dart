import 'package:flutter/material.dart';
import 'package:sunnah_diet/screens/about_us.dart';
import 'package:sunnah_diet/screens/food_diary.dart';
import 'package:sunnah_diet/screens/home_page.dart';
import 'package:sunnah_diet/screens/report_issue.dart';
import 'package:sunnah_diet/screens/sunnah_info.dart';
import 'package:sunnah_diet/screens/user_profile.dart';
import 'package:sunnah_diet/screens/settings.dart';
import 'package:sunnah_diet/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sunnah_diet/auth.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Widget currentScreen = const HomePage();
  String currentScreenTitle = 'Home';

  Future<void> _signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        title: Text(
          currentScreenTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: currentScreen,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  // image: DecorationImage(
                  //   image: AssetImage('assets/images/logo.png'),
                  //   fit: BoxFit.scaleDown,
                  // ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        // image: DecorationImage(
                        //   image:
                        //       AssetImage('assets/images/default_profile.png'),
                        //   fit: BoxFit.contain,
                        // ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Sunnah Dieting App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentScreen = UserProfile();
                          currentScreenTitle = 'User Profile';
                        });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Welcome, User Name',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                setState(() {
                  currentScreen = const HomePage();
                  currentScreenTitle = 'Home';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                setState(() {
                  currentScreen = const AboutUsPage();
                  currentScreenTitle = 'About Us';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_dining),
              title: const Text('Food Diary'),
              onTap: () {
                setState(() {
                  currentScreen = const FoodDiaryScreen();
                  currentScreenTitle = 'Food Diary';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_library),
              title: const Text('Sunnah Info'),
              onTap: () {
                setState(() {
                  currentScreen = const SunnahInfoPage();
                  currentScreenTitle = 'Sunnah Info';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('User Profile'),
              onTap: () {
                setState(() {
                  currentScreen = UserProfile();
                  currentScreenTitle = 'User Profile';
                });
                Navigator.pop(context);
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: Colors.black38,
              ),
            ),
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: const Text('Settings and Support'),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      setState(() {
                        currentScreen = const SettingsPage();
                        currentScreenTitle = 'Settings';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.bug_report),
                    title: const Text('Report Issue'),
                    onTap: () {
                      setState(() {
                        currentScreen = const ReportIssuePage();
                        currentScreenTitle = 'Report Issue';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('Sign Out'),
                    onTap: () {
                      _signOut();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
