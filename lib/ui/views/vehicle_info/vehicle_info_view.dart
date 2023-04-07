// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/taxi_app_icons.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';

import '../../common/app_strings.dart';
import 'vehicle_info_view.form.dart';
import 'vehicle_info_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: ksCarModelTextField,
  ),
  FormTextField(
    name: 'carColor',
  ),
  FormTextField(
    name: 'vehicleNumber',
  ),
])
class VehicleInfoView extends StackedView<VehicleInfoViewModel>
    with $VehicleInfoView {
  VehicleInfoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VehicleInfoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              verticalSpace(30),
              SvgPicture.asset(
                carIcon,
                height: 60,
                width: 60,
              ),
              verticalSpaceSmall,
              Text(
                ksVehicleInfoPageHeader,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: kcDark,
                    ),
              ),
              verticalSpace(40),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: carModelController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: ksCarModelHint,
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
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: kcDark,
                      ),
                ),
              ),
              verticalSpaceSmall,
              TextField(
                controller: carColorController,
                decoration: InputDecoration(
                    filled: true,
                    hintText: ksCarColorHint,
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    hintStyle:
                        TextStyle(color: kcGrey, fontWeight: FontWeight.bold)),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: kcDark,
                    ),
              ),
              verticalSpaceSmall,
              TextField(
                controller: vehicleNumberController,
                maxLength: 11,
                decoration: InputDecoration(
                    filled: true,
                    hintText: ksCarNumberHint,
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    hintStyle:
                        TextStyle(color: kcGrey, fontWeight: FontWeight.bold)),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: kcDark,
                    ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (carModelController.text.length < 3) {
                    viewModel.showSnackBar(ksCarModelErrorPrompt);
                    return;
                  }

                  if (carColorController.text.length < 3) {
                    viewModel.showSnackBar(ksCarColorErrorPrompt);
                    return;
                  }

                  if (vehicleNumberController.text.length < 3) {
                    viewModel.showSnackBar(ksCarNumberErrorPrompt);
                    return;
                  }

                  viewModel.updateProfile();
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: kcDark, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      ksNext,
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: kcWhite,
                              ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  VehicleInfoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VehicleInfoViewModel();
}
