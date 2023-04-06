import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/app/app.router.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  nToAboutUs() {
    _navigationService.navigateTo(Routes.aboutUsView);
  }

  nToHowItWorks() {
    _navigationService.navigateTo(Routes.howItWorksView);
  }

  signInWithGoogle() {
    _navigationService.navigateTo(Routes.aboutUsView);
  }

  nToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }
}
