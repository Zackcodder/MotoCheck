import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/app/app.locator.dart';
import 'package:transiter_driver/services/url_launcher_service.dart';

import '../../common/app_strings.dart';

class AboutUsViewModel extends BaseViewModel {
  // url launcher service
  final _urlLauncherService = locator<UrlLauncherService>();

  // snackbar service
  final _snackbarService = locator<SnackbarService>();
  launchInstagram(String url) async {
    final didLaunch = await _urlLauncherService.openUrl(url);
    if (!didLaunch) {
      // show error
      _snackbarService.showSnackbar(message: ksInstagramLaunchErrorMsg);
    }
  }
}
