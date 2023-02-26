import 'package:dio/dio.dart';
import 'package:transiter_driver/models/api_response.dart';
import 'package:transiter_driver/models/error_response.dart';

class ApiUtils {
  static ApiResponse toApiResponse(Response res) {
    return ApiResponse(
      statusCode: res.statusCode,
      statusMessage: res.statusMessage,
      rawResponse: res,
      data: res.data,
    );
  }

  static ErrorResponse toErrorResponse(e) {
    return ErrorResponse(
        statusCode: e.response?.statusCode, statusMessage: e.message);
  }
}
