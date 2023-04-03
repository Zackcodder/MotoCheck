import 'dart:async';

import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:transiter_driver/app/app.bottomsheets.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/app/app.router.dart';
import 'package:transiter_driver/models/driver_model.dart';
import 'package:transiter_driver/services/driver_service.dart';
import 'package:transiter_driver/services/geo_location_service.dart';
import 'package:transiter_driver/services/geofire_service.dart';
import 'package:transiter_driver/services/google_map_service.dart';
import 'package:transiter_driver/services/local_storage_service.dart';
import 'package:transiter_driver/ui/common/app_strings.dart';
import 'package:transiter_driver/ui/common/storage_keys.dart';

class MainPageViewModel extends BaseViewModel {
  // google map service
  final _googleMapService = locator<GoogleMapService>();

  final _geoLocationService = locator<GeoLocationService>();

  final _driverService = locator<DriverService>();

  final _storageService = locator<LocalStorageService>();

  final _geoFireService = locator<GeofireService>();

  final _bottomSheetService = locator<BottomSheetService>();

  final _themeService = locator<ThemeService>();

  final _navigationService = locator<NavigationService>();

  DriverModel driver = DriverModel();

  get googlePlex => _googleMapService.googlePlex;

  StreamSubscription? ridePositionStream;

  dynamic _currentPosition;

  /// returns current position
  get currentPosition async =>
      _currentPosition ??= await _geoLocationService.getCurrentPosition();

  bool _isOnline = false;
  bool get isOnline => _isOnline;
  set setOnlineStatus(bool val) => _isOnline = val;

  init() async {
    _isOnline = _storageService.getBool(driverOnlineStatusKey) ?? false;

    _currentPosition = await _geoLocationService.getCurrentPosition();
    notifyListeners();
  }

  convertPositionToLatLng(position) =>
      _googleMapService.convertPositionToLatLng(position);

  String? _darkMapStyle;
  String? get darkMapStyle => _darkMapStyle;
  String? _lightMapStyle;
  String? get lightMapStyle => _lightMapStyle;

  Future loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString('mapStyle/DarkMode.json');
    _lightMapStyle = await rootBundle.loadString('mapStyle/LightMode.json');
  }

  fetchDriverDetails() async {
    final success = await _driverService.fetchDriverDetails();

    if (success) {
      final driverMap = await _storageService.getMap(driveObjectKey);
      driver = DriverModel.fromJson(driverMap.cast<String, dynamic>());
      notifyListeners();
    }
  }

  Future<void> goOnline() async {
    final success = await _geoFireService.goOnline();

    if (success) {
      // makes request to set driver as online
      final res = await _driverService.updateDriverLiveStatus(true);

      if (res == true) {
        _isOnline = true;

        await _storageService.setBool(driverOnlineStatusKey, true);
      }
      notifyListeners();
    }

    // tripRequestRef = FirebaseDatabase.instance
    //     .reference()
    //     .child('driver_users/${currentFirebaseUser.currentUser.uid}/newtrip');
    // tripRequestRef.set('waiting');

    // tripRequestRef.onValue.listen((event) {});

    notifyListeners();
  }

  Future<void> goOffline() async {
    // Geofire.removeLocation(currentFirebaseUser.currentUser.uid);
    // tripRequestRef.onDisconnect();
    // tripRequestRef.remove();
    // tripRequestRef = null;

    final success = await _geoFireService.goOffline();

    if (success) {
      // makes request to set driver as online
      final res = await _driverService.updateDriverLiveStatus(false);
      if (res == true) {
        _isOnline = false;
        await _storageService.setBool(driverOnlineStatusKey, false);
      }
    }
    notifyListeners();
  }

  get geofireGoOnline async => await _geoFireService.goOnline();
  get geofireGoOffline async => await _geoFireService.goOffline();

  Stream get getPositionStream => _geoLocationService.getPositionStream();

  locationUpdates(position) async =>
      _googleMapService.locationUpdates(position: position);

  showUpdateStatusBottomSheet() async {
    setBusy(true);
    final res = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.confirm,
        title: (!isOnline) ? 'GO ONLINE' : 'GO OFFLINE',
        data: {
          'subtitle': (!isOnline)
              ? ksYouAreAboutToBecomeAvailableToReceiveTripRequests
              : ksYouWouldStopReceivingNewTripRequests,
        });
    if (res?.confirmed == true) {
      //
      if (!isOnline) {
        await goOnline();
        setBusy(false);
        return true;
      } else {
        await goOffline();
        setBusy(false);
        return false;
      }
    }
    setBusy(false);
  }

  get cameraUpdate {
    return _googleMapService.cameraUpdate;
  }

  changeTheme() {
    if (_themeService.selectedThemeMode == ThemeManagerMode.light) {
      // set theme to light
      _themeService.setThemeMode(ThemeManagerMode.dark);
    } else {
      // set theme to dark
      _themeService.setThemeMode(ThemeManagerMode.light);
    }
  }

  get circles => _googleMapService.mainPageCircles(_currentPosition);

  // navigates to trips history
  nToMyTrips() {
    _navigationService.navigateTo(Routes.myTripsView);
  }

  //navigates to help page
  nToHelpPage() {
    _navigationService.navigateTo(Routes.howItWorksView);
  }

  //navigates to contact page
  nToContactPage() {
    _navigationService.navigateTo(Routes.contactUsView);
  }

  signOut() async {
    await _storageService.clearStorage();
    _navigationService.pushNamedAndRemoveUntil(Routes.splashScreenView);
  }
}
