import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/app/app.router.dart';

class VehicleInfoViewModel extends BaseViewModel {
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  showSnackBar(String text) {
    _snackbarService.showSnackbar(
      message: text,
    );
  }

  updateProfile() {
    // TODOS network request to update profile

    _navigationService.navigateTo(Routes.addPhoneNumberView);
  }
}
