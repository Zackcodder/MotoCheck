import 'package:flutter/material.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/text_style.dart';
import 'package:transiter_driver/ui/common/themes.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'collect_payment_dialog_model.dart';

class CollectPaymentDialog extends StackedView<CollectPaymentDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const CollectPaymentDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CollectPaymentDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: const EdgeInsets.all(4.0),
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            verticalSpace(20),
            Text(
              'CASH PAYMENT',
              style: ktsBoldText20,
            ),
            verticalSpace(20),
            const Divider(),
            verticalSpace(16),
            Text(
              '\$${request.data['tripCost']}',
              style: ktsBoldText50,
            ),
            verticalSpace(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Amount above is the total fares to be charged to the rider',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: kcGrey),
              ),
            ),
            verticalSpaceLarge,
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                // TODO IMPLEMENT
                // HelperMethods.enableHomTabLocationUpdates();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: isDarkMode(context) ? kcDarkLight : kcDark,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      "Collect",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: kcWhite),
                    ),
                  ),
                ),
              ),
            ),
            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }

  @override
  CollectPaymentDialogModel viewModelBuilder(BuildContext context) =>
      CollectPaymentDialogModel();
}
