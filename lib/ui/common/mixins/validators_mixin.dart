import 'package:transiter_driver/ui/extensions/string_extension.dart';

mixin ValidatorMixin {
  static int inputLength = 6;

  String? validateNotEmptyField(String input, [String? label]) {
    if (input.isEmpty) {
      return label == null ? 'This field cannot be empty' : 'Enter a $label';
    } else {
      return null;
    }
  }

  static String? validateEmail(String? input) {
    if (input == null) {
      return 'Enter a valid email address';
    } else if (input.validateEmail()) {
      return null;
    } else if (input.isEmpty) {
      return 'Enter your email';
    } else {
      return 'Enter a valid email address';
    }
  }

  static String? validatePassword(String? input) {
    if (input == 'null' || input!.isEmpty) {
      return 'Enter your password';
    } else {
      return null;
    }
  }

  bool? isPasswordValid(String password) {
    if (password.length < inputLength) {
      return false;
    }
    if (password.isEmpty) {
      return false;
    }

    return true;
  }

  String? validateConfirmPasswordField(String input, String password) {
    if (input != password) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }

  bool emailValidation(String input) {
    if (input.isEmpty) {
      return false;
    } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_"
                r'`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
            .hasMatch(input) &&
        input.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool passValidation(
    String input,
  ) {
    if (input.length < 6 || input.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  // bool phoneValidation(String input) {
  //   if (input.validNigerianNumber()) {
  //     return true;
  //   }
  //   return false;
  // }
}
