class RideHistoryModel {
  bool? response;
  String? rideID;
  String? riderLongitude;
  String? riderLatitude;
  String? firstName;
  String? riderID;
  String? lastName;
  String? email;
  String? phone;
  String? riderImage;
  String? driverID;
  String? driverLongitude;
  String? driverLatitude;
  String? driverFirstName;
  String? driverLastName;
  String? driverEmail;
  String? driverPhone;
  dynamic driverImage;
  String? pickupLocation;
  String? destination;
  String? destinationLongitude;
  String? destinationLatitude;
  String? pickupTime;
  String? amount;
  String? tripDate;
  String? tripStatus;
  String? pushNotification;

  RideHistoryModel(
      {this.response,
      this.rideID,
      this.riderLongitude,
      this.riderLatitude,
      this.firstName,
      this.riderID,
      this.lastName,
      this.email,
      this.phone,
      this.riderImage,
      this.driverID,
      this.driverLongitude,
      this.driverLatitude,
      this.driverFirstName,
      this.driverLastName,
      this.driverEmail,
      this.driverPhone,
      this.driverImage,
      this.pickupLocation,
      this.destination,
      this.destinationLongitude,
      this.destinationLatitude,
      this.pickupTime,
      this.amount,
      this.tripDate,
      this.tripStatus,
      this.pushNotification});

  RideHistoryModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    rideID = json['RideID'];
    riderLongitude = json['RiderLongitude'];
    riderLatitude = json['RiderLatitude'];
    firstName = json['FirstName'];
    riderID = json['RiderID'];
    lastName = json['LastName'];
    email = json['Email'];
    phone = json['Phone'];
    riderImage = json['RiderImage'];
    driverID = json['DriverID'];
    driverLongitude = json['DriverLongitude'];
    driverLatitude = json['DriverLatitude'];
    driverFirstName = json['DriverFirstName'];
    driverLastName = json['DriverLastName'];
    driverEmail = json['DriverEmail'];
    driverPhone = json['DriverPhone'];
    driverImage = json['DriverImage'];
    pickupLocation = json['PickupLocation'];
    destination = json['Destination'];
    destinationLongitude = json['DestinationLongitude'];
    destinationLatitude = json['DestinationLatitude'];
    pickupTime = json['PickupTime'];
    amount = json['Amount'];
    tripDate = json['TripDate'];
    tripStatus = json['TripStatus'];
    pushNotification = json['PushNotification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    data['RideID'] = rideID;
    data['RiderLongitude'] = riderLongitude;
    data['RiderLatitude'] = riderLatitude;
    data['FirstName'] = firstName;
    data['RiderID'] = riderID;
    data['LastName'] = lastName;
    data['Email'] = email;
    data['Phone'] = phone;
    data['RiderImage'] = riderImage;
    data['DriverID'] = driverID;
    data['DriverLongitude'] = driverLongitude;
    data['DriverLatitude'] = driverLatitude;
    data['DriverFirstName'] = driverFirstName;
    data['DriverLastName'] = driverLastName;
    data['DriverEmail'] = driverEmail;
    data['DriverPhone'] = driverPhone;
    data['DriverImage'] = driverImage;
    data['PickupLocation'] = pickupLocation;
    data['Destination'] = destination;
    data['DestinationLongitude'] = destinationLongitude;
    data['DestinationLatitude'] = destinationLatitude;
    data['PickupTime'] = pickupTime;
    data['Amount'] = amount;
    data['TripDate'] = tripDate;
    data['TripStatus'] = tripStatus;
    data['PushNotification'] = pushNotification;
    return data;
  }
}
