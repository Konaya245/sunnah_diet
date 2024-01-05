import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'At Sunnah Dieting, we value your privacy and are committed to protecting your personal information in accordance with the laws and regulations of Malaysia. This Privacy Policy outlines how we collect, use, disclose, and protect your personal data when you use our mobile application.',
              ),
              SizedBox(height: 20),
              Text(
                '1. Collection of Personal Information:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'We may collect personal information such as your name, email address, and demographic details when you voluntarily provide it to us during the registration process or while using our app. We ensure that the collection of personal data is done with your consent and for legitimate purposes related to our services.',
              ),
              SizedBox(height: 20),
              Text(
                '2. Use of Personal Information:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'We use your personal information to provide and improve our services, personalize your app experience, and communicate with you regarding updates, new features, or relevant information. Your data may also be used for statistical analysis and research purposes, ensuring we enhance our app\'s functionality and meet user needs.',
              ),
              SizedBox(height: 20),
              Text(
                '3. Disclosure of Personal Information:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'We do not sell, trade, or disclose your personal information to third parties without your consent, unless required by law or for the purposes of improving our services. In some cases, we may engage trusted third-party service providers who assist us in delivering our app\'s functionalities, and they are bound by strict confidentiality agreements.',
              ),
              SizedBox(height: 20),
              Text(
                '4. Data Security:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'We implement appropriate security measures to safeguard your personal information from unauthorized access, disclosure, alteration, or destruction. These measures include encryption, firewalls, and regular security assessments to protect your data and maintain its integrity.',
              ),
              SizedBox(height: 20),
              Text(
                '5. Data Retention:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'We retain your personal information only for as long as necessary to fulfill the purposes outlined in this Privacy Policy, or as required by law. When no longer required, we will securely delete or anonymize your data.',
              ),
              SizedBox(height: 20),
              Text(
                '6. User Rights:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'You have the right to access, correct, or delete your personal information held by us. If you wish to exercise these rights or have any concerns about your privacy, please contact us using the contact details provided below.',
              ),
              SizedBox(height: 20),
              Text(
                '7. Updates to the Privacy Policy:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'We may update this Privacy Policy from time to time to reflect changes in our practices or legal obligations. We encourage you to review the Privacy Policy periodically for any updates.',
              ),
              SizedBox(height: 32),
              Text(
                'For any inquiries or concerns regarding our Privacy Policy or data practices, please contact us at privacy@sunnahdieting.com',
              ),
              SizedBox(height: 20),
              Text(
                  'By using the Sunnah Dieting app, you agree to the terms and conditions outlined in this Privacy Policy.'),
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
