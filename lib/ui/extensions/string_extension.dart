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
}
