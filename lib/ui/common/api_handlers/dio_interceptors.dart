// This file contains dio interceptors
import 'package:dio/dio.dart';
import 'package:transiter_driver/app/app.logger.dart';

class DioInterceptor implements Interceptor {
  final log = getLogger("DioInterceptor");

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log.i('METHOD: ${options.method}');
    log.i('ENDPOINT: ${options.uri}');
    //log.i('HEADERS: ' + options.headers.toString());
    log.i('DATA: ${options.data ?? options.queryParameters}');

    handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    log.i('ENDPOINT: ${err.requestOptions.uri}');
    log.i('STATUSCODE: ${err.error}');
    log.i('MESSAGE: ${err.response?.data ?? err.message}');

    handler.next(err);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    log.i('ENDPOINT: ${response.requestOptions.uri}');
    log.i('STATUSCODE: ${response.statusCode}');
    log.i('DATA: ${response.data}');

    handler.next(response);
  }
}
