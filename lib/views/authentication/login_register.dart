import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sunnah_diet/services/auth.dart';
import 'package:sunnah_diet/utils/validate.dart';
import 'package:flutter/gestures.dart';
import 'package:sunnah_diet/views/settings/privacy_policy.dart';
import 'package:sunnah_diet/views/settings/terms_and_conditions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Validator validator = Validator();
  String? errorMessage = '';
  bool isLogin = true;
  bool isLoading = false; // Add isLoading variable

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  bool agreeToTerms = false;
  bool agreeToPrivacyPolicy = false;
  bool showTermsError = false; // Add showTermsError variable
  bool showPrivacyError = false; // Add showPrivacyError variable

  Future<void> signInWithEmailAndPassword() async {
    setState(() {
      isLoading =
          true; // Set isLoading to true when starting the sign in process
    });

    try {
      await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        switch (e.code) {
          case 'invalid-credential':
            errorMessage = 'Invalid email/password entered. Please try again.';
            break;
          default:
            errorMessage =
                'An unknown error occurred with error code: ${e.code}.';
        }
      });
    } finally {
      setState(() {
        isLoading =
            false; // Set isLoading to false when sign in process is completed
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    setState(() {
      isLoading =
          true; // Set isLoading to true when starting the sign up process
    });

    try {
      await Auth().createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      User? user = Auth().currentUser;
      if (user != null) {
        await user.updateDisplayName(_displayNameController.text);
        await user.reload();
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage =
                'The account already exists for that email. Login instead.';
            break;
          default:
            errorMessage =
                'An unknown error occurred with error code: ${e.code}.';
        }
      });
    } finally {
      setState(() {
        isLoading =
            false; // Set isLoading to false when sign up process is completed
      });
    }
  }

  Widget _title() {
    return Text(
      isLogin ? 'Welcome back!' : 'Create an Account',
      style: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controller,
      String? Function(String?)? validator,
      {bool obscureText =
          false} // Add closing parenthesis ')' after the default value
      ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
      validator: validator,
      obscureText: obscureText, // Set the obscureText property
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Hmm? $errorMessage',
      style: const TextStyle(color: Colors.red),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(
            0xFF034620), // Set the button background color to #034620
        padding: const EdgeInsets.symmetric(
            vertical: 16, horizontal: 32), // Increase the padding
        minimumSize: const Size(170, 48), // Set the minimum size of the button
      ),
      onPressed: isLoading
          ? null
          : () {
              // Disable button when isLoading is true
              if (_formKey.currentState!.validate()) {
                if (!isLogin) {
                  setState(() {
                    showTermsError = !agreeToTerms;
                    showPrivacyError = !agreeToPrivacyPolicy;
                  });
                }
                if (isLogin || (agreeToTerms && agreeToPrivacyPolicy)) {
                  isLogin
                      ? signInWithEmailAndPassword()
                      : createUserWithEmailAndPassword();
                }
              }
            },
      child: isLoading
          ? const CircularProgressIndicator() // Show CircularProgressIndicator when isLoading is true
          : Text(
              isLogin ? 'Login' : 'Sign Up',
              style: const TextStyle(
                color: Colors.white, // Set the text color to white
              ),
            ),
    );
  }

  Widget _loginOrRegisterButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(isLogin
              ? 'Don\'t have an account? '
              : 'Already have an account? '),
          GestureDetector(
            onTap: () {
              setState(() {
                isLogin = !isLogin;
              });
            },
            child: Text(isLogin ? 'Register instead' : 'Login instead',
                style: const TextStyle(
                  color: Colors.blue,
                )),
          ),
        ],
      ),
    );
  }

  Widget _forgotPasswordButton() {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            TextEditingController emailController = TextEditingController();
            return AlertDialog(
              title: const Text('Forgot Password'),
              content: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Send'),
                  onPressed: () {
                    String email = emailController.text;
                    // Implement forgot password functionality using Firebase
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email)
                        .then((value) {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Success'),
                            content: const Text(
                                'Password reset email sent successfully.'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }).catchError((error) {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                'An error occurred while sending the password reset email.'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });
                  },
                ),
              ],
            );
          },
        );
      },
      child: const Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: Text(
          'Forgot your password?',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  Widget _termsAndConditionsCheckbox() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CheckboxListTile(
        title: RichText(
          text: TextSpan(
            text: 'I agree to the ',
            style: const TextStyle(
                fontSize: 13, color: Colors.black, fontFamily: 'Poppins'),
            children: [
              TextSpan(
                text: 'Terms and Conditions',
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigation logic goes here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TermsAndConditionsPage()),
                    );
                  },
              ),
            ],
          ),
        ),
        value: agreeToTerms,
        onChanged: (value) {
          setState(() {
            agreeToTerms = value!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        subtitle: showTermsError
            ? const Text(
                'Please agree to the Terms and Conditions',
                style: TextStyle(color: Colors.red),
              )
            : null,
      ),
    );
  }

  Widget _privacyPolicyCheckbox() {
    return CheckboxListTile(
      title: RichText(
        text: TextSpan(
          text: 'I agree to the ',
          style: const TextStyle(
              fontSize: 13, color: Colors.black, fontFamily: 'Poppins'),
          children: [
            TextSpan(
              text: 'Privacy Policy',
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigation logic goes here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyPage()),
                  );
                },
            ),
          ],
        ),
      ),
      value: agreeToPrivacyPolicy,
      onChanged: (value) {
        setState(() {
          agreeToPrivacyPolicy = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      subtitle: showPrivacyError
          ? const Text(
              'Please agree to the Privacy Policy',
              style: TextStyle(color: Colors.red),
            )
          : null,
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/icon/icon.PNG'),
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 4.0),
                  child: _title(),
                ),
                if (!isLogin)
                  _entryField(
                    'Display Name',
                    _displayNameController,
                    (value) {
                      return validator.validateDisplayName(value, isLogin);
                    },
                  ),
                _entryField(
                  'Email',
                  _emailController,
                  validator.validateEmail,
                ),
                _entryField(
                  'Password',
                  _passwordController,
                  validator.validatePassword,
                  obscureText: true,
                ),
                if (!isLogin)
                  _entryField(
                    'Repeat Password',
                    _repeatPasswordController,
                    (value) {
                      return validator.validateRepeatPassword(
                          value, isLogin, _passwordController.text);
                    },
                    obscureText: true,
                  ),
                if (!isLogin) _termsAndConditionsCheckbox(),
                if (!isLogin) _privacyPolicyCheckbox(),
                _errorMessage(),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: _submitButton(),
                ),
                if (isLogin) _forgotPasswordButton(),
                _loginOrRegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
