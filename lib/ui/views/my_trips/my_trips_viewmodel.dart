import 'package:stacked/stacked.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/models/ride_history_model.dart';
import 'package:transiter_driver/services/driver_service.dart';
import 'package:transiter_driver/services/local_storage_service.dart';
import 'package:transiter_driver/ui/common/storage_keys.dart';

class MyTripsViewModel extends BaseViewModel {
  // driver service
  final _driverService = locator<DriverService>();

  final _storageService = locator<LocalStorageService>();

  List<RideHistoryModel> _rideHistoryList = [];
  List<RideHistoryModel> get rideHistoryList => _rideHistoryList;

  fetchTripHistory() async {
    setBusy(true);
    _rideHistoryList = _storageService
        .getList(driverRideHistoryKey)
        .map((e) => RideHistoryModel.fromJson(e))
        .toList();
    final res = await _driverService.fetchTripHistory();

    if (res.runtimeType != bool) {
      _rideHistoryList = res;
    }
    setBusy(false);

    notifyListeners();
  }
}
