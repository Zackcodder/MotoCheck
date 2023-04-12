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

  // bool _hidePassword = false;

  // This is the toggle button to hide and show user password
  // setPasswordVisibility(bool value) {
  //   _hidePassword = value;
  // }

  // This is the login function button
  login() async {
    setBusy(true);
    if (emailValue == null ||
        emailValue!.isEmpty ||
        passwordValue == null ||
        passwordValue!.isEmpty) {
      _snackbarService.showSnackbar(message: ksEnterEmailAndPassword);
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
    setBusy(false);
  }
}
