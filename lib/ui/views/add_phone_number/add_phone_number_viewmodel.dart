import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.locator.dart';

import '../../common/app_strings.dart';

class AddPhoneNumberViewModel extends FormViewModel {
  // snackbar service
  final _snackbarService = locator<SnackbarService>();
  updateProfile() {
    // make request to update profile

    // success Take user to the Main Page
  }

  showSnackbar() {
    // error snackbar
    _snackbarService.showSnackbar(
        message: ksValidPhoneNumberError);
  }
}

class AddPhoneNumberValidators {
  static String? validatePhoneNumber(String? value) {
    if (value == null) {
      return null;
    }

    if (value.length < 11) {
      return ksValidPhoneNumberError;
    }
    return null;
  }
}
