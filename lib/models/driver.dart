// import 'package:firebase_database/firebase_database.dart';

class Driver {
  String? carModel;
  String? carColor;
  String? vehicleNumber;
  String? phoneNumber;

  Driver({
    this.carModel,
    this.carColor,
    this.vehicleNumber,
    this.phoneNumber,
  });

  // Driver.fromSnapshot(DataSnapshot snapshot) {
  //   carModel = snapshot.value['vehicle_details']['car_model'];
  //   carColor = snapshot.value['vehicle_details']['car_color'];
  //   vehicleNumber = snapshot.value['vehicle_details']['vehicle_number'];
  //   phoneNumber = snapshot.value['phone']['phoneNumber'];
  // }
}
