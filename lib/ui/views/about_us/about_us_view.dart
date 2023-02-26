import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/app_constants.dart';
import 'package:transiter_driver/ui/common/taxi_app_icons.dart';
import 'package:transiter_driver/ui/common/text_style.dart';
import 'package:transiter_driver/ui/common/themes.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';

import 'about_us_viewmodel.dart';

class AboutUsView extends StackedView<AboutUsViewModel> {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AboutUsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Image.asset(
                    "images/logo1.png",
                    height: 80,
                    width: 80,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                verticalSpaceSmall,
                Text(
                  "Transiter",
                  style: ktsBoldText22,
                ),
                Text("Lets take you there",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: kcGrey)),
                verticalSpace(40),
                GestureDetector(
                  onTap: () {
                    viewModel.launchInstagram(launchInstaAppUrl);
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: isDarkMode(context) ? kcDarkLight : kcDark,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          instagramIcon,
                          height: 20,
                          width: 20,
                          theme: const SvgTheme(currentColor: kcWhite),
                        ),
                        verticalSpaceSmall,
                        Text("Instagram",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 18.sp, color: kcWhite)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  AboutUsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AboutUsViewModel();
}
