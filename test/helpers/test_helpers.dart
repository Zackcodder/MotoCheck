import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/services/url_launcher_service.dart';
import 'package:transiter_driver/services/google_map_service.dart';
import 'package:transiter_driver/services/geo_location_service.dart';
import 'package:transiter_driver/services/map_service.dart';
import 'package:transiter_driver/services/map_toolkit_service.dart';
import 'package:transiter_driver/services/polyline_points_service.dart';
import 'package:transiter_driver/services/authentication_service.dart';
import 'package:transiter_driver/services/local_storage_service.dart';
import 'package:transiter_driver/services/driver_service.dart';
import 'package:transiter_driver/services/geofire_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UrlLauncherService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<GoogleMapService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<GeoLocationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<MapService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<MapToolkitService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PolylinePointsService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthenticationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LocalStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DriverService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<GeofireService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterUrlLauncherService();
  getAndRegisterGoogleMapService();
  getAndRegisterGeoLocationService();
  getAndRegisterMapService();
  getAndRegisterMapToolkitService();
  getAndRegisterPolylinePointsService();
  getAndRegisterAuthenticationService();
  getAndRegisterLocalStorageService();
  getAndRegisterDriverService();
  getAndRegisterGeofireService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockUrlLauncherService getAndRegisterUrlLauncherService() {
  _removeRegistrationIfExists<UrlLauncherService>();
  final service = MockUrlLauncherService();
  locator.registerSingleton<UrlLauncherService>(service);
  return service;
}

MockGoogleMapService getAndRegisterGoogleMapService() {
  _removeRegistrationIfExists<GoogleMapService>();
  final service = MockGoogleMapService();
  locator.registerSingleton<GoogleMapService>(service);
  return service;
}

MockGeoLocationService getAndRegisterGeoLocationService() {
  _removeRegistrationIfExists<GeoLocationService>();
  final service = MockGeoLocationService();
  locator.registerSingleton<GeoLocationService>(service);
  return service;
}

MockMapService getAndRegisterMapService() {
  _removeRegistrationIfExists<MapService>();
  final service = MockMapService();
  locator.registerSingleton<MapService>(service);
  return service;
}

MockMapToolkitService getAndRegisterMapToolkitService() {
  _removeRegistrationIfExists<MapToolkitService>();
  final service = MockMapToolkitService();
  locator.registerSingleton<MapToolkitService>(service);
  return service;
}

MockPolylinePointsService getAndRegisterPolylinePointsService() {
  _removeRegistrationIfExists<PolylinePointsService>();
  final service = MockPolylinePointsService();
  locator.registerSingleton<PolylinePointsService>(service);
  return service;
}

MockAuthenticationService getAndRegisterAuthenticationService() {
  _removeRegistrationIfExists<AuthenticationService>();
  final service = MockAuthenticationService();
  locator.registerSingleton<AuthenticationService>(service);
  return service;
}

MockLocalStorageService getAndRegisterLocalStorageService() {
  _removeRegistrationIfExists<LocalStorageService>();
  final service = MockLocalStorageService();
  locator.registerSingleton<LocalStorageService>(service);
  return service;
}

MockDriverService getAndRegisterDriverService() {
  _removeRegistrationIfExists<DriverService>();
  final service = MockDriverService();
  locator.registerSingleton<DriverService>(service);
  return service;
}

MockGeofireService getAndRegisterGeofireService() {
  _removeRegistrationIfExists<GeofireService>();
  final service = MockGeofireService();
  locator.registerSingleton<GeofireService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
