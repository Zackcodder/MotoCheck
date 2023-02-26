import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  /// launches a url
  Future<bool> openUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      return false;
    }
    return true;
  }

  openPhone(String url) async {
    return await launchUrl(Uri.parse(url));
  }
}
