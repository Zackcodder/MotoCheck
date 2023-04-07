import 'dart:convert';

import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/app/app.router.dart';
import 'package:transiter_driver/models/driver_model.dart';
import 'package:transiter_driver/models/error_response.dart';
import 'package:transiter_driver/models/ride_history_model.dart';
import 'package:transiter_driver/services/geo_location_service.dart';
import 'package:transiter_driver/ui/common/api_handlers/api_routes.dart';
import 'package:transiter_driver/ui/common/api_handlers/transiter_api.dart';
import 'package:transiter_driver/ui/common/app_constants.dart';
import 'package:transiter_driver/ui/common/app_strings.dart';
import 'package:transiter_driver/ui/common/storage_keys.dart';

import 'local_storage_service.dart';

class DriverService {
  final api = TransiterApiHandler(launchInstaAppUrl);

  final _storageService = locator<LocalStorageService>();

  final _navigationService = locator<NavigationService>();

  final _locationSerice = locator<GeoLocationService>();

  // snackbar
  final _snackbarService = locator<SnackbarService>();
  // fetch driver details
  fetchDriverDetails() async {
    String? driverId = _storageService.getString(loginIdKey);

    if (driverId == null || driverId.isEmpty) {
      await _storageService.clearStorage();

      _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
      _snackbarService.showSnackbar(message: ksCannotFetchDriverDetails);
    }
    final res = await api.get('${ApiRoutes.driverDetails}?DriverID=$driverId');
    if (res.runtimeType != ErrorResponse) {
      final response = json.decode(res.data);

      if (response['userdataresponse'] == true) {
        final model = DriverModel.fromJson(response);

        await _storageService.setMap(driveObjectKey, model.toJson());
        return true;
      }
    }

    return false;
  }

  updateDriverLiveStatus(bool online) async {
    String? driverId = await _storageService.getDriverId;

    final position =
        await _locationSerice.getCurrentPosition(asPosition: false);

    if (driverId == null || driverId.isEmpty) {
      return false;
    }
    String status = online ? 'online' : 'offline';
    final res = await api.get(
        '${ApiRoutes.setDriverStatus}?updatedriverstatus=$status&UID=$driverId&CurrentLongitude=${position[1]}&CurrentLatitude=${position[0]}');

    final response = json.decode(res.data);

    if (response['response'] == true) {
      final model = DriverModel.fromJson(response);

      await _storageService.setMap(driveObjectKey, model.toJson());
      return true;
    }
  }

  // fetch driver details
  fetchTripHistory() async {
    String? driverId = _storageService.getString(loginIdKey);

    if (driverId == null || driverId.isEmpty) {
      await _storageService.clearStorage();

      _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
      _snackbarService.showSnackbar(message: ksCannotFetchDriverDetails);
    }
    final res =
        await api.get('${ApiRoutes.rideHistory}?UID=$driverId&getrides');
    if (res.runtimeType != ErrorResponse) {
      final response = json.decode(res.rawResponse.toString());
      if (response.runtimeType == List<dynamic>) {
        List<RideHistoryModel> list = response
            .map((e) => RideHistoryModel.fromJson(e))
            .cast<RideHistoryModel>()
            .toList();

        await _storageService.setList(driverRideHistoryKey, list);
        return list;
      } else {
        await _storageService.setList(
            driverRideHistoryKey, [].cast<RideHistoryModel>());

        return [].cast<RideHistoryModel>();
      }
    }

    return false;
  }
}
