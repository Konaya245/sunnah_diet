import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      if (_isDrawerOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sunnah Dieting App',
          style: TextStyle(
            color: Colors.green,
            decoration: TextDecoration.underline,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animationController,
          ),
          onPressed: _toggleDrawer,
          color: Colors.green,
        ),
      ),
      body: const Stack(
        children: [
          // Add your page content here
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                // Handle About Us page navigation
              },
            ),
            ListTile(
              title: const Text('Food Diary'),
              onTap: () {
                // Handle Food Diary page navigation
              },
            ),
            ListTile(
              title: const Text('Sunnah Info'),
              onTap: () {
                // Handle Sunnah Info page navigation
              },
            ),
            ListTile(
              title: const Text('User Profile'),
              onTap: () {
                // Handle User Profile page navigation
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Handle Settings page navigation
              },
            ),
          ],
        ),
      ),
    );
  }
}
