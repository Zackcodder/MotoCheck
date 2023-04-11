import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HowItWorksViewModel extends BaseViewModel {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // ..setBackgroundColor( Colors.white)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://transiter.jellywebb.com/blog/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://transiter.jellywebb.com/blog/'));
}
