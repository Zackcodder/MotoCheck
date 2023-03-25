import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transiter_driver/ui/common/mixins/validators_mixin.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';
import 'package:transiter_driver/ui/shared_widgets/dumb_widgets/primary_button.dart';
import 'package:transiter_driver/ui/shared_widgets/dumb_widgets/primary_textfield.dart';

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
              Text(
                'Login',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              verticalSpaceLarge,
              TransiterTextField(
                hintText: 'Email',
                controller: emailController,
              ),
              verticalSpaceMedium,
              TransiterTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              verticalSpace(35),
              PrimaryButton(
                height: 48.h,
                text: 'Send',
                onPressed: !viewModel.isBusy
                    ? () async {
                        // Focus.of(context).unfocus();
                        FocusScope.of(context).unfocus();
                        await viewModel.login();
                      }
                    : null,
              ),
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
