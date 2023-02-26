import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.locator.dart';

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
        message: 'Please provide a valid Phone Number');
  }
}

class AddPhoneNumberValidators {
  static String? validatePhoneNumber(String? value) {
    if (value == null) {
      return null;
    }

    if (value.length < 11) {
      return 'Please provide a valid phone number';
    }
    return null;
  }
}
