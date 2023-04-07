// ignore_for_file: unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/app/app.router.dart';
import 'package:transiter_driver/models/error_response.dart';
import 'package:transiter_driver/services/authentication_service.dart';
import 'package:transiter_driver/ui/common/app_strings.dart';
import 'package:transiter_driver/ui/views/login/login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  bool hidepassword = false;
  bool loading = false;
  bool get hidepasswords => hidepassword;
  // This is the toggle button to hide and show user password
  togglePasswordView() {
    hidepassword = !hidepassword;
  }

  // This is the login function button
  login() async {
    loading = true;
    setBusy(true);
    if (emailValue == null ||
        emailValue!.isEmpty ||
        passwordValue == null ||
        passwordValue!.isEmpty) {
      _snackbarService.showSnackbar(message: ksEnterEmailAndPassword);
      loading = false;
      setBusy(false);
      return;
    }
    final res = await _authenticationService.login(
        email: emailValue!, password: passwordValue!);

    if (res.runtimeType != ErrorResponse) {
      if (res == true) {
        // login successful, do something
        _navigationService.pushNamedAndRemoveUntil(Routes.mainPageView);
      }
    }
    loading = false;
    setBusy(false);
  }

  loader() {
    CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white));
  }
}
