//#TODO make a getstarted thingy
import 'package:flutter/material.dart';

class GetStartedPage extends StatefulWidget {
  final VoidCallback onFinished;

  const GetStartedPage({super.key, required this.onFinished});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 275, // Adjust the width as desired
              height: 275, // Adjust the height as desired
              child: SlideTransition(
                position: _slideAnimation,
                child: Image.asset('assets/images/logo-slogan.png'),
              ),
            ),
            const SizedBox(height: 20),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {
                    widget.onFinished();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                        0xFF034620), // Set the button background color to #034620
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32), // Increase the padding
                    minimumSize: const Size(
                        170, 50), // Set the minimum size of the button
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Set the text color to white
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
