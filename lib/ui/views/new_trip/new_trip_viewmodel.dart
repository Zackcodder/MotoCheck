import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.dialogs.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/models/error_response.dart';
import 'package:transiter_driver/models/tripdetails.dart';
import 'package:transiter_driver/services/geo_location_service.dart';
import 'package:transiter_driver/services/google_map_service.dart';
import 'package:transiter_driver/services/map_service.dart';
import 'package:transiter_driver/services/polyline_points_service.dart';
import 'package:transiter_driver/services/url_launcher_service.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/helper_methods.dart';
import 'package:transiter_driver/ui/extensions/trip_details_extension.dart';

class NewTripViewModel extends BaseViewModel {
  final _googleMapService = locator<GoogleMapService>();
  final _geoLocationService = locator<GeoLocationService>();

  final _mapService = locator<MapService>();

  final _dialogService = locator<DialogService>();

  final _navigationService = locator<NavigationService>();

  final _urlLauncherService = locator<UrlLauncherService>();

  final _polylinePointsService = locator<PolylinePointsService>();

  StreamSubscription? ridePositionStream;

  double _mapPaddingBottom = 0;
  double get mapPaddingBottom => _mapPaddingBottom;
  set setMapPaddingBottom(double padding) => _mapPaddingBottom = padding;

  bool _isRequestingDirection = false;
  bool get isRequestingDirection => _isRequestingDirection;

  String _status = 'accepted';
  String get status => _status;
  set setStatus(val) => _status = val;

  String _buttonTitle = 'ARRIVED';
  String get buttonTitle => _buttonTitle;
  set setButtonTitle(val) => _buttonTitle = val;

  Color _buttonColor = kcDarkLight;
  Color get buttonColor => _buttonColor;
  set setButtonColor(val) => _buttonColor = val;

  String _durationString = 'accepted';
  String get durationString => _durationString;

  dynamic _circles;
  dynamic get circles => _circles;
  dynamic _markers;
  dynamic get markers => _markers;
  dynamic _polyLines;
  dynamic get polyLines => _polyLines;

  dynamic _myPosition;
  dynamic get myPosition => _myPosition;

  Timer? _timer;
  Timer? get timer => _timer;

  int _durationCounter = 0;
  int get durationCounter => _durationCounter;

  String? _darkMapStyle;
  String? get darkMapStyle => _darkMapStyle;
  String? _lightMapStyle;
  String? get lightMapStyle => _lightMapStyle;

  createMarker(imageConfiguration) {
    _googleMapService.createMarker(imageConfiguration);
  }

  get googlePlex => _googleMapService.googlePlex;

  get currentPosition async => await _geoLocationService.getCurrentPosition();

  getDirection({required List pickup, required List destination}) async {
    final res = await _mapService.getDirections(
        pickup: pickup, destination: destination);

    if (res.runtimeType != ErrorResponse) {
      var cordinates =
          _polylinePointsService.decodePolyPoints(res.encodedPoints);

      _googleMapService.setPolyLine(cordinates);

      _googleMapService.fitPolyLineToMap(
          pickup: pickup, destination: destination);
    }
  }

  updateLatLngBounds() => _googleMapService.latLngBoundsUpdate;

  getLocationUpdates(List<dynamic> oldLatLng) {
    ridePositionStream =
        _geoLocationService.getPositionStream().listen((position) async {
      _myPosition = position;
      await _googleMapService.locationUpdates(
          position: position, oldLatLng: oldLatLng);
    });
  }

  updateTripDetails({required TripDetailsModel tripDetails}) async {
    if (!isRequestingDirection) {
      _isRequestingDirection = true;

      if (_myPosition == null) {
        return;
      }

      var positionLatLng = [_myPosition!.latitude, _myPosition!.longitude];

      List<dynamic> destinationLatLng;

      if (status == 'accepted') {
        destinationLatLng = tripDetails.pickup ?? [];
      } else {
        destinationLatLng = tripDetails.destination ?? [];
      }

      var directionDetails = await _mapService.getDirections(
          pickup: positionLatLng, destination: destinationLatLng);

      if (directionDetails != null) {
        _durationString = directionDetails.durationText;
      }
      _isRequestingDirection = false;
    }
  }

  showProgressDialog() {
    _dialogService.showCustomDialog(variant: DialogType.progress, data: {
      'status': 'Please wait...',
    });
  }

  void startTimer() {
    const interval = Duration(seconds: 1);
    _timer = Timer.periodic(interval, (timer) {
      _durationCounter++;
    });
  }

  void endTrip({required TripDetailsModel tripDetails}) async {
    // saveTrip = FirebaseDatabase.instance.reference().child('driver_users/${currentFirebaseUser.currentUser.uid}/myTrips').push();

    _timer?.cancel();

    showProgressDialog();

    var currentLatLng = [myPosition!.latitude, myPosition!.longitude];

    var directionDetails = await _mapService.getDirections(
        pickup: tripDetails.pickup ?? [], destination: currentLatLng);

    _navigationService.back();

    int fares = estimateFares(directionDetails, durationCounter);

    // rideRef.child('tripCost').set(fares.toString());

    // rideRef.child('status').set('ended');

    Map saveMyTrips = {
      'created_at': DateTime.now().toString(),
      'rider_name': tripDetails.nameOfRider,
      'rider_phone': tripDetails.tripRiderPhone,
      'rider_Photo': tripDetails.photoOfRider,
      'person_number': tripDetails.passengerNumber,
      'pickup_address': tripDetails.tripPickupAddress,
      'destination_address': tripDetails.tripDestinationAddress,
      'payment_method': tripDetails.tripPaymentMethod,
      'rider_id': tripDetails.tripRideId,
      'tripCost': tripDetails.tripTotalCost,
    };

    // TODO SAVE TRIP TO BACKEND

    // saveTrip.set(saveMyTrips);

    ridePositionStream?.cancel();

    _dialogService.showCustomDialog(variant: DialogType.collectPayment, data: {
      'tripCost': tripDetails.tripTotalCost,
    });

    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) => CollectPayment(
    //           paymentMethod: widget.tripDetails.paymentMethod,
    //           tripCost: widget.tripDetails.tripCost,
    //         ));

    topUpEarnings(fares);
  }

  void topUpEarnings(int fares) {
    // implemetn
  }

  openPhone(String phone) {
    _urlLauncherService.openPhone(phone);
  }

  get cameraUpdate {
    return _googleMapService.cameraUpdate;
  }

  getDriverInfo() {
    // TODO IMPLEMENT FROM BACK END
  }

  void acceptTrip() {
    // TODO IMPLEMENT FROM BACK END
  }

  Future loadMapStyles() async {
    // _darkMapStyle = await rootBundle.loadString('mapStyle/DarkMode.json');
    // _lightMapStyle = await rootBundle.loadString('mapStyle/LightMode.json');
  }
}
