import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/taxi_app_icons.dart';
import 'package:transiter_driver/ui/common/text_style.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';

import '../../common/app_strings.dart';
import 'splash_screen_viewmodel.dart';

class SplashScreenView extends StackedView<SplashScreenViewModel> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SplashScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splashscreen2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.white.withOpacity(0.04),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ksCompanyName,
                    style: fugazTextStyle(color: kcWhite, fontSize: 50),
                  ),
                  Text(
                    ksForDriver,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          letterSpacing: 0.7,
                          color: kcWhite,
                        ),
                  ),
                  verticalSpace(200),
                  GestureDetector(
                    onTap: () async {
                      viewModel.signInWithGoogle();
                    },
                    child: Container(
                      height: 60,
                      width: 290,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 3),
                                blurRadius: 20)
                          ]),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              googleIcon,
                              height: 30,
                              width: 30,
                              theme: const SvgTheme(
                                currentColor: kcWhite,
                              ),
                            ),
                            verticalSpace(20),
                            Text(
                              ksSiginInButtonLabelForDriverApp,
                              style: ktsNormaltext16.copyWith(
                                color: kcWhite,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              // ignore: deprecated_member_use
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        viewModel.nToAboutUs();
                      },
                      child: Text(
                        ksCompanyName,
                        style: ktsNormaltext16.copyWith(
                          color: kcWhite,
                        ),
                      )),
                  const Text(
                    "-",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        viewModel.nToHowItWorks();
                      },
                      child: Text(
                        ksFromJellyWebb,
                        style: ktsNormaltext16.copyWith(
                          color: kcWhite,
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  SplashScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashScreenViewModel();
}
