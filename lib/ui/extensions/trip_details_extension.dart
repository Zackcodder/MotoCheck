import 'package:transiter_driver/models/tripdetails.dart';

extension TripDetailsExtension on TripDetailsModel {
  String get nameOfRider {
    if (riderName.runtimeType != String || riderName == null) {
      return 'N/A';
    }
    return riderName!;
  }

  String get costOfTrip {
    if (tripCost.runtimeType != String || tripCost == null) {
      return 'N/A';
    }
    return tripCost!;
  }

  String get tripPickupAddress {
    if (pickupAddress.runtimeType != String || pickupAddress == null) {
      return 'N/A';
    }
    return pickupAddress!;
  }

  String get tripDestinationAddress {
    if (destinationAddress.runtimeType != String ||
        destinationAddress == null) {
      return 'N/A';
    }
    return destinationAddress!;
  }

  String get passengerNumber {
    if (personNumber.runtimeType != String || personNumber == null) {
      return 'N/A';
    }
    return personNumber!;
  }

  String get photoOfRider {
    if (riderPhoto.runtimeType != String || riderPhoto == null) {
      return 'N/A';
    }
    return riderPhoto!;
  }

  String get tripRiderPhone {
    if (riderPhone.runtimeType != String || riderPhone == null) {
      return 'N/A';
    }
    return riderPhone!;
  }

  String get tripPaymentMethod {
    if (paymentMethod.runtimeType != String || paymentMethod == null) {
      return 'N/A';
    }
    return paymentMethod!;
  }

  String get tripRideId {
    if (rideID.runtimeType != String || rideID == null) {
      return 'N/A';
    }
    return rideID!;
  }

  String get tripTotalCost {
    if (tripCost.runtimeType != String || tripCost == null) {
      return 'N/A';
    }
    return tripCost!;
  }
}
