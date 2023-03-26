import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/models/error_response.dart';
import 'package:transiter_driver/services/authentication_service.dart';
import 'package:transiter_driver/ui/views/login/login_view.form.dart';

import '../../../app/app.router.dart';

class LoginViewModel extends FormViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  login() async {
    setBusy(true);
    final res = await _authenticationService.login(
        email: emailValue!, password: passwordValue!);

    if (res.runtimeType != ErrorResponse) {
      if (res == true) {
      //  _navigationService.navigateTo(Routes.myTripsView);
       _navigationService.pushNamedAndRemoveUntil(Routes.mainPageView);
        // login successful, do something
      }
    }
    setBusy(false);
  }
}
