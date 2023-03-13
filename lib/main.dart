import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:transiter_driver/app/app.bottomsheets.dart';
import 'package:transiter_driver/app/app.dialogs.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/ui/common/themes.dart';

import 'ui/common/app_strings.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  // initialise theme manager
  await ThemeManager.initialise();

  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ThemeBuilder(
              defaultThemeMode: ThemeMode.system,
              darkTheme: darkTheme,
              lightTheme: lightTheme,
              builder: (context, regularTheme, darkTheme, themeMode) {
                return MaterialApp(
                  title: ksAppTitle,
                  initialRoute: Routes.splashScreenView,
                  onGenerateRoute: StackedRouter().onGenerateRoute,
                  navigatorKey: StackedService.navigatorKey,
                  navigatorObservers: [
                    StackedService.routeObserver,
                  ],
                  theme: regularTheme,
                  darkTheme: darkTheme,
                  themeMode: themeMode!,
                );
              });
        });
  }
}
