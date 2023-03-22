import 'package:flutter/material.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/app_strings.dart';
import 'package:transiter_driver/ui/common/themes.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'progress_dialog_model.dart';

// const double _graphicSize = 60;

class ProgressDialog extends StackedView<ProgressDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ProgressDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProgressDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: isDarkMode(context) ? kcDarkLight : kcWhite,
            borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              horizontalSpaceTiny,
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  isDarkMode(context) ? Colors.white : kcDark,
                ),
              ),
              horizontalSpaceMedium,
              Text(
                request.data[ksStatus],
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProgressDialogModel viewModelBuilder(BuildContext context) =>
      ProgressDialogModel();
}
