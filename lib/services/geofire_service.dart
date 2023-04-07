import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/services/geo_location_service.dart';
import 'package:transiter_driver/services/local_storage_service.dart';
import 'package:transiter_driver/ui/common/app_strings.dart';

class GeofireService {
  final _storageService = locator<LocalStorageService>();

  final _locationService = locator<GeoLocationService>();

  final _snackbarService = locator<SnackbarService>();

  Future<bool> goOnline() async {
    String? driverId = await _storageService.getDriverId;

    final position =
        await _locationService.getCurrentPosition(asPosition: false);

    if (driverId == null || position == null) {
      _snackbarService.showSnackbar(message: ksCannotGoOnline);
      return false;
    }
    Geofire.initialize('driversAvailable');
    Geofire.setLocation(driverId, position[0], position[1]);

    return true;

    // tripRequestRef = FirebaseDatabase.instance
    //     .reference()
    //     .child('driver_users/${currentFirebaseUser.currentUser.uid}/newtrip');
    // tripRequestRef.set('waiting');

    // tripRequestRef.onValue.listen((event) {});
  }

  Future<bool> goOffline() async {
    String? driverId = await _storageService.getDriverId;

    if (driverId == null) {
      _snackbarService.showSnackbar(message: ksCannotGoOffline);
      return false;
    }
    Geofire.removeLocation(driverId);

    return true;

    // tripRequestRef = FirebaseDatabase.instance
    //     .reference()
    //     .child('driver_users/${currentFirebaseUser.currentUser.uid}/newtrip');
    // tripRequestRef.set('waiting');

    // tripRequestRef.onValue.listen((event) {});
  }
}
