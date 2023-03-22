import 'dart:io';

import 'package:intl/intl.dart';

extension StringExtension on String {
  String formatCurrency(
      {String? locale, String? symbol, String? name, bool decimal = false}) {
    /// TODOS USE DYNAMIC LOCALE
    String curr =
        NumberFormat.currency(locale: Platform.localeName, symbol: symbol)
            .format(double.parse(this));
    if (!decimal) {
      return curr.substring(0, curr.indexOf('.'));
    }
    return curr;
  }

  bool validateEmail() {
    const emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final regExp = RegExp(emailPattern);

    return regExp.hasMatch(trim());
  }

  // Minimum 8 Character Password with lowercase, uppercase letters, numbers,
  //special characters and at least one lowercase letter, one uppercase letter,
  //one number and one special character
  bool excellentPassword() {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$';
    //r"""^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!"#\$%&'\(\)\*\+,-\.\/:;<=>\?@[\]\^_`\{\|}~])[a-zA-Z0-9!"#\$%&'\(\)\*\+,-\.\/:;<=>\?@[\]\^_`\{\|}~]{8,}$""";

    final regExp = RegExp(pattern);

    return regExp.hasMatch(this);
  }
}
