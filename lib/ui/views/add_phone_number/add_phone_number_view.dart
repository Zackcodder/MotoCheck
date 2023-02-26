import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/taxi_app_icons.dart';
import 'package:transiter_driver/ui/common/themes.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';

import 'add_phone_number_view.form.dart';
import 'add_phone_number_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'phoneNumber',
    validator: AddPhoneNumberValidators.validatePhoneNumber,
  ),
])
class AddPhoneNumberView extends StackedView<AddPhoneNumberViewModel>
    with $AddPhoneNumberView {
  AddPhoneNumberView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AddPhoneNumberViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            verticalSpace(30),
            SvgPicture.asset(
              callIcon,
              height: 40,
              width: 40,
              theme: SvgTheme(
                  currentColor: isDarkMode(context) ? kcWhite : kcDark),
            ),
            verticalSpaceSmall,
            Text(
              'Add your Phone Number',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: isDarkMode(context) ? kcWhite : kcDark,
                  ),
            ),
            verticalSpace(40),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  hintStyle: TextStyle(
                    color: isDarkMode(context) ? kcWhite : kcGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: isDarkMode(context) ? kcWhite : kcDark,
                    ),
              ),
            ),
            verticalSpace(20),
            GestureDetector(
              onTap: () {
                if (phoneNumberController.text.length < 7) {
                  viewModel.showSnackbar();
                  return;
                }

                viewModel.updateProfile();
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: isDarkMode(context) ? kcWhite : kcDarkLight,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Finish",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: kcWhite,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(AddPhoneNumberViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(AddPhoneNumberViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  AddPhoneNumberViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddPhoneNumberViewModel();
}
