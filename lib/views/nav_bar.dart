import 'package:flutter/material.dart';
import 'package:sunnah_diet/views/about_us/about_us.dart';
import 'package:sunnah_diet/views/admin/admin_act.dart';
import 'package:sunnah_diet/views/food_diary/food_diary.dart';
import 'package:sunnah_diet/views/home_page/home_page.dart';
import 'package:sunnah_diet/views/report_issue/report_issue.dart';
import 'package:sunnah_diet/views/sunnah_info/sunnah_info.dart';
import 'package:sunnah_diet/views/user_profile/user_profile.dart';
import 'package:sunnah_diet/views/settings/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sunnah_diet/services/auth.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Widget currentScreen = const HomePage();
  String currentScreenTitle = 'Home';
  Future<bool>? isAdminFuture;

  final Auth auth = Auth();
  User? user;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
    isAdminFuture = auth.isAdmin();
  }

  Future<void> _signOut() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isAdminFuture,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          ); // Show a loading spinner while waiting for isAdmin to complete
        } else if (snapshot.hasError) {
          return Text(
              'Error: ${snapshot.error}'); // Show an error message if isAdmin has an error
        } else {
          bool isAdmin = snapshot.data ??
              false; // Update isAdmin with the result of isAdmin
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
              backgroundColor: const Color(0xFF034620),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: currentScreen,
            drawer: Drawer(
              backgroundColor: Colors.white,
              child: ListView(
                children: [
                  DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Color(0xFF034620),
                        // image: DecorationImage(
                        //   image: AssetImage('assets/images/logo.png'),
                        //   fit: BoxFit.scaleDown,
                        // ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                              // shape: BoxShape.circle,
                              // color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage('assets/icon/icon.PNG'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Sunnah Dieting App',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 2),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentScreen = UserProfile();
                                currentScreenTitle = 'User Profile';
                              });
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Welcome, ${isAdmin ? 'Admin' : user?.displayName ?? 'User name'}',
                              style: const TextStyle(
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
                  isAdmin
                      ? ListTile(
                          leading: const Icon(Icons.admin_panel_settings),
                          title: const Text('Admin Dashboard'),
                          onTap: () {
                            setState(() {
                              currentScreen = const AdminDashboardPage();
                              currentScreenTitle = 'Admin Dashboard';
                            });
                            Navigator.pop(context);
                          },
                        )
                      : Container(), //if not admin, empty container
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
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
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
      },
    );
  }
}
