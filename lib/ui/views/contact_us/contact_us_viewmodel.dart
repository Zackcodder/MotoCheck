import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.locator.dart';

class ContactUsViewModel extends BaseViewModel {
  final _snackbarService = locator<SnackbarService>();

  showSnackBar(String text) {
    _snackbarService.showSnackbar(
      message: text,
    );
  }

  sendData() {
    // TODO network request for contact form
  }
}
