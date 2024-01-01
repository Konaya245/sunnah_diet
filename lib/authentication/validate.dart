class Validator {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateDisplayName(String? value, bool isLogin) {
    if (!isLogin && (value == null || value.isEmpty)) {
      return 'Please enter your display name';
    }
    return null;
  }

  String? validateRepeatPassword(String? value, bool isLogin, String password) {
    if (!isLogin && (value == null || value.isEmpty)) {
      return 'Please repeat your password';
    }
    if (!isLogin && value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateTermsAndConditions(bool value) {
    if (!value) {
      return 'Please agree to the Terms and Conditions';
    }
    return null;
  }

  String? validatePrivacyPolicy(bool value) {
    if (!value) {
      return 'Please agree to the Privacy Policy';
    }
    return null;
  }
}
