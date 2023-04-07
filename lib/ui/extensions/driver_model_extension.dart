import 'package:transiter_driver/models/driver_model.dart';

extension DriverModelExtension on DriverModel {
  String get fullName {
    return '${firstName ?? ''} ${lastName ?? ''}';
  }

  String get driverFirstName {
    return firstName ?? '';
  }

  String get driverPhotoUrl {
    return imageUrl ?? '';
  }
}
