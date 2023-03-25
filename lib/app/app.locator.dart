// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';

import '../services/authentication_service.dart';
import '../services/geo_location_service.dart';
import '../services/google_map_service.dart';
import '../services/local_storage_service.dart';
import '../services/map_service.dart';
import '../services/map_toolkit_service.dart';
import '../services/polyline_points_service.dart';
import '../services/url_launcher_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UrlLauncherService());
  locator.registerLazySingleton(() => GoogleMapService());
  locator.registerLazySingleton(() => GeoLocationService());
  locator.registerLazySingleton(() => MapService());
  locator.registerLazySingleton(() => MapToolkitService());
  locator.registerLazySingleton(() => PolylinePointsService());
  locator.registerLazySingleton(() => AuthenticationService());
  final localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton(localStorageService);
}
