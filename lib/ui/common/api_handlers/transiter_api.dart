import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/app/app.logger.dart';

// import 'package:stacked_services/stacked_services.dart'
//     hide FormData, MultipartFile;
// import 'package:waso_business_app/models/api_response.dart';
import 'api_utils.dart';
import 'dio_interceptors.dart';
import 'failures.dart';

class TransiterApiHandler {
  final log = getLogger('TransiterApiHandler');
  final dio = Dio();
  final snackbar = locator<SnackbarService>();

  TransiterApiHandler(baseUrl) {
    dio.interceptors.add(DioInterceptor());
    dio.options.sendTimeout = const Duration(seconds: 30); // 30 seconds
    dio.options.receiveTimeout = const Duration(seconds: 30); // 30 seconds
    dio.options.baseUrl = baseUrl;
    log.i('Transiter Api constructed and DIO setup register');
  }
  CancelToken cancelToken = CancelToken();

  /// cancels network reques
  cancelRequest() {
    cancelToken.cancel();
  }

  Future<dynamic> get(
    String string, {
    Map<String, dynamic>? queryParameters,
    String? token,
    bool showErrorSnackbar = true,
  }) async {
    log.i('Making request to $string');
    try {
      final response = await dio.get(string.toString(),
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          options: token == null
              ? null
              : Options(headers: {'Authorization': 'Bearer $token'}));

      log.i(
          'Response xsds from $string \n${response.data.runtimeType == List<dynamic>}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      if (!showErrorSnackbar) {
        return ApiUtils.toErrorResponse(e);
      }
      if (e.response?.data != null) {
        if (e.response?.statusCode == 503) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: 'Could not perform request at the moment',
          );
        } else if (e.response?.data?['message'] == String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'],
          );
        } else if (e.response?.data?['message'] != String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'] ??
                e.response?.data['error'] ??
                'An error occured',
          );
        }
      } else if (e.type == DioErrorType.connectionTimeout) {
        if (showErrorSnackbar) {
          return;
        }
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.receiveTimeout) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.badResponse &&
          e.response?.statusCode != 419) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      }

      return ApiUtils.toErrorResponse(e);
    } on SocketException {
      if (showErrorSnackbar) {
        return;
      }
      snackbar.showSnackbar(
          duration: const Duration(seconds: 10),
          message: 'Check your internet');
    } catch (e) {
      snackbar.showSnackbar(
        duration: const Duration(seconds: 10),
        message: 'An error occured',
      );
    }
  }

  Future<dynamic> post(
    String string, {
    Map<String, dynamic>? body,
    String? token,
    String? errorMessage,
  }) async {
    log.i('Making request to $string');
    try {
      final response = await dio.post(
        string,
        data: body != null ? jsonEncode(body) : null,
        options: token == null
            ? null
            : Options(
                headers: {'Authorization': 'Bearer $token'},
              ),
      );
      log.i('Response from $string \n${response.data}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      if (e.response?.data != null) {
        if (e.response?.statusCode == 503) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: 'Could not perform request at the moment',
          );
        } else if (e.response?.data?['message'] == String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'],
          );
        } else if (e.response?.data?['message'] != String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 10),
            message: e.response?.data?['message'] ??
                e.response?.data['error'] ??
                e.message ??
                'An error occured',
          );
        }
        log.w(e.toString());
        handleApiError(e);
      } else if (e.type == DioErrorType.connectionTimeout) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.receiveTimeout) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.badResponse &&
          e.response?.statusCode != 419) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.unknown) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      }
      return ApiUtils.toErrorResponse(e);
    } on SocketException {
      snackbar.showSnackbar(
          duration: const Duration(seconds: 10),
          message: 'Please check your internet');
    }
  }

  Future<dynamic> put(
    String string, {
    required Map<String, dynamic> body,
    String? token,
  }) async {
    log.i('Making request to $string');
    try {
      final response = await dio.put(string.toString(),
          data: body,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      log.i('Response from $string \n${response.data}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      if (e.response?.data != null) {
        if (e.response?.statusCode == 503) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: 'Could not perform request at the moment',
          );
        } else if (e.response?.data?['message'] == String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'],
          );
        } else if (e.response?.data?['message'] != String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'] ??
                e.response?.data['error'] ??
                'An error occured',
          );
        }
        log.w(e.toString());
      }
      handleApiError(e);
    } on SocketException {
      snackbar.showSnackbar(
          duration: const Duration(seconds: 10),
          message: 'Please check your internet');
    }
  }

  // upload image
  Future<dynamic> uploadImage(
    String path, {
    required File image,
  }) async {
    var formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        image.path,
        filename: image.path.split(Platform.pathSeparator).last,
        contentType: MediaType("image", "jpeg"),
      ),
    });
    try {
      final response = await dio.post(
        path,
        options: Options(
            // headers: {'Authorization': 'Bearer $token', 'token': 'Bearer $token'},
            ),
        data: formData,
      );

      // return res.data;
      log.i('Response from $path \n${response.data}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      if (e.response?.data != null) {
        if (e.response?.statusCode == 503) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: 'Could not perform request at the moment',
          );
        } else if (e.response?.data?['message'] == String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'],
          );
        } else if (e.response?.data?['message'] != String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'] ??
                e.response?.data['error'] ??
                'An error occured',
          );
        }
        log.w(e.toString());
      } else if (e.type == DioErrorType.connectionTimeout) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.receiveTimeout) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.badResponse &&
          e.response?.statusCode != 419) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      }
      return ApiUtils.toErrorResponse(e);
      // handleApiError(e);

      // return "error uploading the image";
    } on SocketException {
      snackbar.showSnackbar(
          duration: const Duration(seconds: 10),
          message: 'Please check your internet');
      return "error uploading the image";
    } catch (e) {
      snackbar.showSnackbar(
          duration: const Duration(seconds: 10),
          message: 'Upload picture failed');
      return ApiUtils.toErrorResponse(e);
    }
  }

  // upload image
  Future<dynamic> updateImage(String path,
      {required File image, required String token}) async {
    var formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        image.path,
        filename: image.path.split(Platform.pathSeparator).last,
        contentType: MediaType("image", "jpeg"),
      ),
    });
    try {
      final response = await dio.patch(
        path,
        options: Options(
          headers: {'Authorization': 'Bearer $token', 'token': 'Bearer $token'},
        ),
        data: formData,
      );

      // return res.data;
      log.i('Response from $path \n${response.data}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      if (e.response?.statusCode == 503) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: 'Could not perform request at the moment',
        );
      } else if (e.response?.data != null) {
        if (e.response?.data?['message'] == String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'],
          );
        } else if (e.response?.data?['message'] != String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'] ??
                e.response?.data['error'] ??
                'An error occured',
          );
        }
        log.w(e.toString());
      } else if (e.type == DioErrorType.connectionTimeout) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.receiveTimeout) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.badResponse &&
          e.response?.statusCode != 419) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      }
      return ApiUtils.toErrorResponse(e);
      // handleApiError(e);

      // return "error uploading the image";
    } on SocketException {
      snackbar.showSnackbar(
          duration: const Duration(seconds: 10),
          message: 'Please check your internet');
      return "error uploading the image";
    } catch (e) {
      snackbar.showSnackbar(
        duration: const Duration(seconds: 10),
        message: 'asUploadProfilePictureFailed',
      );
      return ApiUtils.toErrorResponse(e);
    }
  }

  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? body,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final res = await dio.patch(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return ApiUtils.toApiResponse(res);
    } on DioError catch (e) {
      if (e.response?.data != null) {
        if (e.response?.statusCode == 503) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: 'Could not perform request at the moment',
          );
        } else if (e.response?.data?['message'] == String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'],
          );
        } else if (e.response?.data?['message'] != String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'] ??
                e.response?.data['error'] ??
                'An error occured',
          );
        }
        log.w(e.toString());
      } else if (e.type == DioErrorType.connectionTimeout) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.receiveTimeout) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.badResponse &&
          e.response?.statusCode != 419) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      }
      // handleApiError(e);
      return ApiUtils.toErrorResponse(e);
    } on SocketException {
      snackbar.showSnackbar(
          duration: const Duration(seconds: 10),
          message: 'Please check your internet');
    } catch (e) {
      snackbar.showSnackbar(
          duration: const Duration(seconds: 10), message: 'An error occured');
      return ApiUtils.toErrorResponse(e);
    }
  }

  Future<dynamic> getPicture(String url, {String? token}) async {
    try {
      final res = await dio.getUri(
        Uri.parse(url),
        options: token != null
            ? Options(
                responseType: ResponseType.bytes,
                headers: {'Authorization': 'Bearer $token'})
            : Options(responseType: ResponseType.bytes),
      );
      return res;
    } on DioError catch (e) {
      if (e.response?.statusCode == 503) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: 'Could not perform request at the moment',
        );
      } else if (e.response?.data != null) {
        if (e.response?.data?['message'] == String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'],
          );
        } else if (e.response?.data?['message'] != String) {
          snackbar.showSnackbar(
            duration: const Duration(seconds: 3),
            message: e.response?.data?['message'] ??
                e.response?.data['error'] ??
                'An error occured',
          );
        }
        log.w(e.toString());
      } else if (e.type == DioErrorType.connectionTimeout) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.receiveTimeout) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      } else if (e.type == DioErrorType.badResponse &&
          e.response?.statusCode != 419) {
        snackbar.showSnackbar(
          duration: const Duration(seconds: 3),
          message: e.message ?? 'An error occured',
        );
      }
      // handleApiError(e);
      return ApiUtils.toErrorResponse(e);
    } on SocketException {
      snackbar.showSnackbar(
          duration: const Duration(seconds: 10),
          message: 'Please check your internet');
    } catch (e) {
      snackbar.showSnackbar(
          duration: const Duration(seconds: 10), message: 'An error occured');
      return ApiUtils.toErrorResponse(e);
    }
  }

  // Future<ApiResponse?> delete(String string,
  //     {Map<String, dynamic>? body, String? token}) async {
  //   log.i('Making request to $string');
  //   try {
  //     final response = await dio.delete(
  //       string,
  //       data: body,
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );

  //     log.i('Response from $string \n${response.data}');
  //     return ApiUtils.toApiResponse(response);
  //   } on DioError catch (e) {
  //     if (e.response!.data!['message'] == String) {
  //       snackbar.showSnackbar(
  //         duration: const Duration(seconds: 3),
  //   //         message: e.response!.data!['message'],
  //       );
  //     } else if (e.response!.data!['message'] != String) {
  //       snackbar.showSnackbar(
  //         duration: const Duration(seconds: 3),
  //   //         message: e.response!.data!['message'] ??
  //             e.response!.data['error'] ??
  //             e.response!.data['detail'] ??
  //             'An error occured',
  //       );
  //     }
  //     log.w(e.toString());
  //     handleApiError(e);
  //   } on SocketException {
  //     snackbar.showSnackbar(
  //         duration: const Duration(seconds: 10),
  //   //         message: 'Please check your internet');
  //   }
  // }

  Failure handleApiError(DioError e) {
    if (e.type == DioErrorType.cancel) {
      return InputFailure(errorMessage: e.message ?? 'An error occured');
    } else if (e.type == DioErrorType.connectionTimeout) {
      return NetworkFailure(errorMessage: e.message ?? 'An error occured');
    } else if (e.type == DioErrorType.receiveTimeout) {
      return NetworkFailure(errorMessage: e.message ?? 'An error occured');
    } else if (e.type == DioErrorType.sendTimeout) {
      return NetworkFailure(errorMessage: e.message ?? 'An error occured');
    } else if (e.type == DioErrorType.badResponse) {
      return ServerFailure(errorMessage: e.response?.data?['message']);
    } else if (e.type == DioErrorType.unknown) {
      return UnknownFailure(errorMessage: e.message ?? 'An error occured');
    } else {
      return UnknownFailure(errorMessage: e.message ?? 'An error occured');
    }
  }
}
