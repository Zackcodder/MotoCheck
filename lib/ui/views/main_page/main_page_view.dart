import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'main_page_viewmodel.dart';

class MainPageView extends StackedView<MainPageViewModel> {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainPageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  MainPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainPageViewModel();
}
