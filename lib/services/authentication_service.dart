import 'dart:convert';

import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/models/error_response.dart';
import 'package:transiter_driver/models/login_model.dart';
import 'package:transiter_driver/ui/common/api_handlers/api_routes.dart';
import 'package:transiter_driver/ui/common/api_handlers/transiter_api.dart';
import 'package:transiter_driver/ui/common/app_constants.dart';
import 'package:transiter_driver/ui/common/app_strings.dart';
import 'package:transiter_driver/ui/common/storage_keys.dart';

import 'local_storage_service.dart';

class AuthenticationService {
  final api = TransiterApiHandler(loginBaseUrl);

  final _snackbarService = locator<SnackbarService>();

  final _storageService = locator<LocalStorageService>();

  /// login user
  login({required String email, required String password}) async {
    final res =
        await api.get('${ApiRoutes.login}&email=$email&password=$password');

    if (res.runtimeType != ErrorResponse) {
      final model =
          LoginModel.fromJson(json.decode(res.rawResponse.toString()));
      if (model.loginresponse == true) {
        if (model.isADriver == true) {
          String? driverApproval = model.driverApproval?.toLowerCase();
          if (driverApproval == 'approved') {
            _storageService.setString(loginIdKey, model.loginID ?? '');
            // approved
            return true;
          } else if (driverApproval == 'pending') {
            // pending review, cannot access app
            _snackbarService.showSnackbar(
                message: ksYourDriveApprovalIsPending);
            return false;
          } else if (driverApproval == 'suspended') {
            // suspended cannot access the app
            _snackbarService.showSnackbar(
                message: ksYouHaveBeenSuspendedFromDriving);
            return false;
          } else {
            // not approved for some other reason
          }
        } else {
          // not a driver
          _snackbarService.showSnackbar(message: ksYouAreNotADriver);
          return false;
        }
      } else {
        _snackbarService.showSnackbar(message: ksInvalidLogin);
      }
    }
    return res;
  }
}
