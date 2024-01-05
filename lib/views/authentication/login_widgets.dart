// // #TODO: figure out how to use these with the variables in the authentication screens
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sunnah_diet/views/authentication/login_register.dart';

// class LoginWidgets {
//   final bool isLogin;
//   LoginWidgets({required this.isLogin});

//   Widget _title() {
//     return Text(
//       isLogin ? 'Welcome back!' : 'Create an Account',
//       style: const TextStyle(
//         color: Colors.green,
//         fontWeight: FontWeight.bold,
//         fontSize: 26,
//       ),
//     );
//   }

//   Widget _entryField(
//     String title,
//     TextEditingController controller,
//     String? Function(String?)? validator,
//   ) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: title,
//       ),
//       validator: validator,
//     );
//   }

//   Widget _errorMessage() {
//     return Text(
//       errorMessage == '' ? '' : 'Humm ? $errorMessage',
//       style: const TextStyle(color: Colors.red),
//     );
//   }

//   Widget _submitButton() {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: const Color(
//             0xFF034620), // Set the button background color to #034620
//       ),
//       onPressed: isLoading
//           ? null
//           : () {
//               // Disable button when isLoading is true
//               if (_formKey.currentState!.validate()) {
//                 if (!isLogin) {
//                   setState(() {
//                     showTermsError = !agreeToTerms;
//                     showPrivacyError = !agreeToPrivacyPolicy;
//                   });
//                 }
//                 if (isLogin || (agreeToTerms && agreeToPrivacyPolicy)) {
//                   isLogin
//                       ? signInWithEmailAndPassword()
//                       : createUserWithEmailAndPassword();
//                 }
//               }
//             },
//       child: isLoading
//           ? const CircularProgressIndicator() // Show CircularProgressIndicator when isLoading is true
//           : Text(
//               isLogin ? 'Login' : 'Sign Up',
//               style: const TextStyle(
//                 color: Colors.white, // Set the text color to white
//               ),
//             ),
//     );
//   }

//   Widget _loginOrRegisterButton() {
//     return TextButton(
//       onPressed: () {
//         setState(() {
//           isLogin = !isLogin;
//         });
//       },
//       child: Text(isLogin ? 'Register instead' : 'Login instead',
//           style: const TextStyle(color: Colors.green)),
//     );
//   }

//   Widget _forgotPasswordButton() {
//     return TextButton(
//       onPressed: () {
//         // Implement forgot password functionality using Firebase
//         FirebaseAuth.instance
//             .sendPasswordResetEmail(email: _emailController.text)
//             .then((value) {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: const Text('Success'),
//                 content: const Text('Password reset email sent successfully.'),
//                 actions: <Widget>[
//                   TextButton(
//                     child: const Text('OK'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         }).catchError((error) {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: const Text('Error'),
//                 content: const Text(
//                     'An error occurred while sending the password reset email.'),
//                 actions: <Widget>[
//                   TextButton(
//                     child: const Text('OK'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         });
//       },
//       child: const Text(
//         'Forgot your password?',
//         style: TextStyle(
//           color: Colors.blue,
//           decoration: TextDecoration.underline,
//         ),
//       ),
//     );
//   }

//   Widget _termsAndConditionsCheckbox() {
//     return CheckboxListTile(
//       title: const Text(
//         'I agree to the Terms and Conditions',
//         style: TextStyle(fontSize: 12),
//       ),
//       value: agreeToTerms,
//       onChanged: (value) {
//         setState(() {
//           agreeToTerms = value!;
//         });
//       },
//       controlAffinity: ListTileControlAffinity.leading,
//       subtitle: showTermsError
//           ? const Text(
//               'Please agree to the Terms and Conditions',
//               style: TextStyle(color: Colors.red),
//             )
//           : null,
//     );
//   }

//   Widget _privacyPolicyCheckbox() {
//     return CheckboxListTile(
//       title: const Text(
//         'I agree to the Privacy Policy',
//         style: TextStyle(fontSize: 12),
//       ),
//       value: agreeToPrivacyPolicy,
//       onChanged: (value) {
//         setState(() {
//           agreeToPrivacyPolicy = value!;
//         });
//       },
//       controlAffinity: ListTileControlAffinity.leading,
//       subtitle: showPrivacyError
//           ? const Text(
//               'Please agree to the Privacy Policy',
//               style: TextStyle(color: Colors.red),
//             )
//           : null,
//     );
//   }
// }
