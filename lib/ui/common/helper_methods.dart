import 'package:transiter_driver/models/directiondetails.dart';

int estimateFares(DirectionDetailsModel details, int durationValue) {
  // per km = $0.3,
  // per minute = $0.2,
  // base fare = $3,

  double baseFare = 2;
  double distanceFare = (details.distanceValue ?? 0 / 1000) * 0.3;
  double timeFare = (durationValue / 60) * 0.2;

  double totalFare = baseFare + distanceFare + timeFare;

  return totalFare.truncate();
}
