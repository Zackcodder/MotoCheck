// import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripDetailsModel {
  String? destinationAddress;
  String? pickupAddress;
  // [latitude,longitude]
  List? pickup;
  // [latitude,longitude]
  List? destination;
  String? rideID;
  String? paymentMethod;
  String? riderName;
  String? riderPhone;
  String? personNumber;
  String? riderPhoto;
  String? tripCost;

  TripDetailsModel(
      {this.pickupAddress,
      this.rideID,
      this.destinationAddress,
      this.destination,
      this.pickup,
      this.paymentMethod,
      this.riderName,
      this.riderPhone,
      this.personNumber,
      this.riderPhoto,
      this.tripCost});
}
