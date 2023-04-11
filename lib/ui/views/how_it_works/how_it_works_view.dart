import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'how_it_works_viewmodel.dart';

class HowItWorksView extends StackedView<HowItWorksViewModel> {
  const HowItWorksView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HowItWorksViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: WebViewWidget(controller: viewModel.controller),
    );
  }

  @override
  HowItWorksViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HowItWorksViewModel();
}
