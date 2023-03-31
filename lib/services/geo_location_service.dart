import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.locator.dart';

class GeoLocationService {
  // navigation service
  final _snackbarService = locator<SnackbarService>();

  bool? serviceEnabled;
  LocationPermission? permission;

  // returns true if app has location permission
  bool get hasPermission =>
      serviceEnabled == true &&
      (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse);

// check if the user already granted permissions to acquire the device's location
  checkPermission() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
  }

// request permission to access the device's location
  requestPermission() async {
    permission = await Geolocator.requestPermission();
  }

// open location settings on user's device's
  openLocationSettings() async {
    // open location settings for android
    await Geolocator.openLocationSettings();
  }

// open app settings on user's device's
  openAppSettings() async {
    // open app settings for android
    await Geolocator.openAppSettings();
  }

  /// returns the position of the device
  /// forceUserCurrentLocation = false would get Last Known positon
  /// forceUserCurrentLocation = true would return current positon. This is slower
  getCurrentPosition({
    bool forceUseCurrentLocation = true,
    bool asPosition = true,
  }) async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled!) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      nToLocationUnavailable('Location service disable. Please enable');

      return null;
    }
    await checkPermission();
    if (permission == LocationPermission.denied) {
      await requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        nToLocationUnavailable('Location permission denied');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // await Geolocator.openAppSettings();
      nToLocationUnavailable('location permission denied');
      await Geolocator.openLocationSettings();
      return null;
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position? position;

    if (forceUseCurrentLocation) {
      position = await Geolocator.getCurrentPosition();
    } else {
      position = await Geolocator.getLastKnownPosition();
      position ??= await Geolocator.getCurrentPosition();
    }
    if (asPosition) {
      return position;
    }
    return [position.latitude, position.longitude];
  }

  // navigate to location unavailable view
  nToLocationUnavailable(String message) {
    _snackbarService.showSnackbar(message: message);
  }

  /// listens to locations. fired whenever there is a change
  Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream();
  }
}
