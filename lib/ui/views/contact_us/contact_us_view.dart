import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/taxi_app_Icons.dart';
import 'package:transiter_driver/ui/common/themes.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';

import 'contact_us_view.form.dart';
import 'contact_us_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'subject',
    // validator: AddPhoneNumberValidators.validatePhoneNumber,
  ),
  FormTextField(
    name: 'message',
    // validator: AddPhoneNumberValidators.validatePhoneNumber,
  ),
])
class ContactUsView extends StackedView<ContactUsViewModel>
    with $ContactUsView {
  ContactUsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ContactUsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    contactUsIcon,
                    height: 50,
                    width: 50,
                    theme: SvgTheme(
                      currentColor: isDarkMode(context) ? kcWhite : kcDark,
                    ),
                  ),
                  verticalSpace(20),
                  Text(
                    "How Can we help you!",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: kcBlack),
                  ),
                  verticalSpace(40),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: subjectController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Subject",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            borderSide: BorderSide.none),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        hintStyle: const TextStyle(
                          color: kcGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: kcDark),
                    ),
                  ),
                  verticalSpaceSmall,
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: messageController,
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      decoration: const InputDecoration(
                          filled: true,
                          hintText: "Message",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          hintStyle: TextStyle(
                              color: kcGrey, fontWeight: FontWeight.bold)),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: kcDark),
                    ),
                  ),
                  verticalSpace(20),
                  GestureDetector(
                    onTap: () {
                      viewModel.sendData();

                      viewModel.showSnackBar(
                          "message sent successfully, after review your message we will send you to your email account, have a nice day");
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: isDarkMode(context) ? kcDarkLight : kcDark,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Send",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: kcWhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  ContactUsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactUsViewModel();
}
