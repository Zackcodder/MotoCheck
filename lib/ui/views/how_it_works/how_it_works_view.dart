import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'how_it_works_viewmodel.dart';

class HowItWorksView extends StackedView<HowItWorksViewModel> {
  const HowItWorksView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HowItWorksViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      body: Center(
        child: Text("How it Work Page"),
      ),
    );
  }

  @override
  HowItWorksViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HowItWorksViewModel();
}
