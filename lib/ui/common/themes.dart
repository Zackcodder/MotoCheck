import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transiter_driver/ui/common/text_style.dart';
import 'app_colors.dart';

final shape = MaterialStateProperty.resolveWith<OutlinedBorder>(
  (_) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r));
  },
);

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
      labelLarge: kts600text20.copyWith(color: kcBlack),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: kcTextField,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0.r),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        foregroundColor: MaterialStateProperty.all(
          ThemeData.dark().textTheme.labelLarge!.color,
        ),
        // backgroundColor: MaterialStateProperty.all(AppColors.pacificBlue),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          ((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return kcBlack.withOpacity(0.4);
            }
            return kcBlack;
          }),
        ),
        shape: shape,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: kcGrey,
      thickness: 1,
    ));

ThemeData darkTheme = ThemeData.dark().copyWith(
    dialogBackgroundColor: kcDark,
    scaffoldBackgroundColor: kcBrownish, // kcDark
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
      labelLarge: kts600text20,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: kcTextField,
      hintStyle: kts500text20,
      contentPadding: EdgeInsets.only(left: 28.w, top: 16.h, bottom: 13.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0.r),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        foregroundColor: MaterialStateProperty.all(
          ThemeData.dark().textTheme.labelLarge!.color,
        ),
        // backgroundColor: MaterialStateProperty.all(AppColors.pacificBlue),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          ((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return kcBlack.withOpacity(0.4);
            }
            return kcBlack;
          }),
        ),
        shape: shape,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: kcGreyLite,
      thickness: 1,
    ));

bool isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;
