import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Please read these Terms and Conditions carefully before using the Sunnah Dieting mobile application.',
              ),
              SizedBox(height: 20),
              Text(
                '1. Acceptance of Terms:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'By using the Sunnah Dieting app, you agree to comply with and be bound by these Terms and Conditions. If you do not agree with any part of these terms, please do not use the app.',
              ),
              SizedBox(height: 20),
              Text(
                '2. Use of the App:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'The Sunnah Dieting app is intended for personal and non-commercial use. You must be at least 18 years old or have parental consent to use the app. You agree to use the app responsibly and in accordance with all applicable laws and regulations.',
              ),
              SizedBox(height: 20),
              Text(
                '3. Intellectual Property:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'All content, trademarks, logos, and intellectual property within the app are the property of Sunnah Dieting or its licensors. You may not modify, reproduce, distribute, or create derivative works of any content without prior written permission.',
              ),
              SizedBox(height: 20),
              Text(
                '4. Privacy:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'We respect your privacy and handle your personal information in accordance with our Privacy Policy. By using the app, you consent to the collection, use, and disclosure of your personal information as described in the Privacy Policy.',
              ),
              SizedBox(height: 20),
              Text(
                '5. Disclaimer of Warranty:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'The Sunnah Dieting app is provided on an "as is" and "as available" basis without any warranties or representations, expressed or implied. We do not guarantee the accuracy, reliability, or availability of the app at all times.',
              ),
              SizedBox(height: 20),
              Text(
                '6. Limitation of Liability:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'In no event shall Sunnah Dieting or its affiliates be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with the use of the app. Your use of the app is at your own risk.',
              ),
              SizedBox(height: 20),
              Text(
                '7. Modifications to the App:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'We reserve the right to modify, suspend, or discontinue the app or any part thereof at any time without prior notice. We shall not be liable to you or any third party for any such modifications, suspensions, or discontinuations.',
              ),
              SizedBox(height: 20),
              Text(
                '8. Governing Law:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'These Terms and Conditions shall be governed by and construed in accordance with the laws of Malaysia. Any disputes arising from these terms shall be subject to the exclusive jurisdiction of the courts of Malaysia.',
              ),
              SizedBox(height: 20),
              Text(
                '9. Severability:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'If any provision of these Terms and Conditions is found to be invalid or unenforceable, the remaining provisions shall remain in full force and effect.',
              ),
              SizedBox(height: 20),
              Text(
                  'By using the Sunnah Dieting app, you acknowledge and agree to these Terms and Conditions.'),
              SizedBox(height: 20),
              Text(
                'Last updated: 1st May 2023',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
