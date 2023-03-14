import 'package:stacked/stacked.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/models/error_response.dart';
import 'package:transiter_driver/services/authentication_service.dart';
import 'package:transiter_driver/ui/views/login/login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final _authenticationService = locator<AuthenticationService>();
  login() async {
    setBusy(true);
    final res = await _authenticationService.login(
        email: emailValue!, password: passwordValue!);

    if (res.runtimeType != ErrorResponse) {
      if (res == true) {
        // login successful, do something
      }
    }

    setBusy(false);
  }
}
