import 'package:maps_toolkit/maps_toolkit.dart';

class MapToolkitService {
  double getMarkerRotation(
      sourceLat, sourceLng, destinationLat, destinationLng) {
    var rotation = SphericalUtil.computeHeading(
        LatLng(sourceLat, sourceLng), LatLng(destinationLat, destinationLng));

    return rotation.toDouble();
  }
}
