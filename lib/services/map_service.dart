import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:transiter_driver/app/app.logger.dart';
import 'package:transiter_driver/ui/common/api_handlers/api_routes.dart';
import 'package:transiter_driver/ui/common/api_handlers/transiter_api.dart';
import 'package:transiter_driver/ui/common/app_constants.dart';
import 'package:transiter_driver/ui/common/storage_keys.dart';

class MapService {
  final log = getLogger('MapService');
  final _api = TransiterApiHandler(googleMapUrl);
// https://maps.googleapis.com/maps/api/directions/json?origin=${startPosition.latitude},${startPosition.longitude}&destination=${endPosition.latitude},${endPosition.longitude}&mode=driving&key=$mapKey
  Future getDirections({
    required List pickup, // [latitude,longitude]
    required List destination, // [latitude,longitude]
  }) async {
    Map<String, dynamic> queryParameters = {
      // [latitude,longitude]
      'origin': '${pickup[0]},${pickup[1]}',
      'destination': '${destination[0]},${destination[1]}',
      'mode': 'driving',
      'key': dotenv.env[googleMapApiKey]!
    };

    final res = await _api.get(
      ApiRoutes.getMapDirection,
      queryParameters: queryParameters,
    );

    if (res.statusCode == 200) {
      final response = json.decode(res.rawResponse.toString());
      return response;
    }
    return res;
  }
}
