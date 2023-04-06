import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/themes.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'confirm_sheet_model.dart';

class ConfirmSheet extends StackedView<ConfirmSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const ConfirmSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    ConfirmSheetModel viewModel,
    Widget? child,
  ) {
    final String title = request.title!;
    final String subtitle = request.data['subtitle'];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: isDarkMode(context) ? kcDark : kcWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15.0.r, // soften the shadow
            spreadRadius: 0.5.r, //extend the shadow
            offset: const Offset(
              0.7, // Move to right 10  horizontally
              0.7, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      height: 220,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
        child: Column(
          children: <Widget>[
            verticalSpaceSmall,
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            verticalSpace(20),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: kcGrey),
            ),
            verticalSpace(24),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDarkMode(context) ? kcWhite : kcDark,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "CANCEL",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => completer!(
                      SheetResponse(confirmed: true),
                    ),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: (title == 'GO ONLINE') ? kcGreen : kcPink,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "CONFIRM",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  ConfirmSheetModel viewModelBuilder(BuildContext context) =>
      ConfirmSheetModel();
}
