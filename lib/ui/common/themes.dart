import 'package:flutter/material.dart';
import 'package:transiter_driver/ui/common/text_style.dart';
import 'app_colors.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    dialogBackgroundColor: Colors.white,
    scaffoldBackgroundColor: kcWhiteBackground,
    textTheme: TextTheme(
      displayLarge: ktsBoldText50.copyWith(color: kcBlack),
      displayMedium: ktsBoldText23.copyWith(color: kcBlack),
      displaySmall: ktsBoldText22.copyWith(color: kcBlack),
      headlineLarge: ktsBoldText18.copyWith(color: kcBlack),
      headlineMedium: ktsBoldText16.copyWith(color: kcBlack),
      headlineSmall: ktsBoldText15.copyWith(color: kcBlack),
      titleLarge: ktsNormaltext16.copyWith(color: kcBlack),
      titleMedium: ktsNormaltext15.copyWith(color: kcBlack),
      bodyLarge: ktsNormaltext14.copyWith(color: kcBlack),
      bodyMedium: ktsNormaltext13.copyWith(color: kcBlack),
      bodySmall: ktsNormaltext12.copyWith(color: kcBlack),
    ),
    dividerTheme: const DividerThemeData(
      color: kcGrey,
      thickness: 1,
    ));

ThemeData darkTheme = ThemeData.dark().copyWith(
    dialogBackgroundColor: kcDark,
    scaffoldBackgroundColor: kcDark,
    textTheme: TextTheme(
      displayLarge: ktsBoldText50.copyWith(color: kcWhite),
      displayMedium: ktsBoldText23.copyWith(color: kcWhite),
      displaySmall: ktsBoldText22.copyWith(color: kcWhite),
      headlineLarge: ktsBoldText18.copyWith(color: kcWhite),
      headlineMedium: ktsBoldText16.copyWith(color: kcWhite),
      headlineSmall: ktsBoldText15.copyWith(color: kcWhite),
      titleLarge: ktsNormaltext16.copyWith(color: kcWhite),
      titleMedium: ktsNormaltext15.copyWith(color: kcWhite),
      bodyLarge: ktsNormaltext14.copyWith(color: kcWhite),
      bodyMedium: ktsNormaltext13.copyWith(color: kcWhite),
      bodySmall: ktsNormaltext12.copyWith(color: kcWhite),
    ),
    dividerTheme: const DividerThemeData(
      color: kcGreyLite,
      thickness: 1,
    ));

bool isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;
