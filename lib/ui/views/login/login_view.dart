// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transiter_driver/ui/common/mixins/validators_mixin.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';
import 'package:transiter_driver/ui/shared_widgets/dumb_widgets/primary_button.dart';
import 'package:transiter_driver/ui/shared_widgets/dumb_widgets/primary_textfield.dart';

import '../../common/app_colors.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'email',
    validator: ValidatorMixin.validateEmail,
  ),
  FormTextField(
    name: 'password',
    validator: ValidatorMixin.validatePassword,
  ),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpaceMassive,

              // This is the app logo on the top of the login page
              Image.asset("assets/images/jellylogo.png"),
              verticalSpaceSmall,

              // This is the login text on the welcome page below the app logo
              Text(
                'Login With Jellywebb',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              verticalSpaceLarge,

              //This is for the email test field
              TransiterTextField(
                hintText: 'Email Address',
                childWidget: Icon(Icons.mail, color: kcBlue, size: 20),
                controller: emailController,
              ),
              verticalSpaceMedium,

              //This is for the password text field
              TransiterTextField(
                controller: passwordController,
                childWidget: Icon(Icons.lock, color: kcBlue, size: 20),
                childWidget2: IconButton(
                  onPressed: viewModel.togglePasswordView(),
                  icon: Icon(
                    !viewModel.hidepassword
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                    size: 20.0,
                    color: kcBlue,
                  ),
                ),
                hintText: 'Password',
                obscureText: viewModel.hidepassword,
              ),
              verticalSpace(35),

              // This is the login button 
              PrimaryButton(
                height: 48.h,
                width: 263,
                text: 'Get in',
                onPressed: !viewModel.isBusy
                    ? () async {
                        // Focus.of(context).unfocus();
                        FocusScope.of(context).unfocus();
                        await viewModel.login();
                      }
                    : null,
              ),
              verticalSpace(35),

              // welcome text for creating account for new user
              Text("One Jellywebb account connects you with the world. Don't have a Jellywebb account?",
               style: Theme.of(context).textTheme.bodyLarge,),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
