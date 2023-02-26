import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:transiter_driver/models/tripdetails.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/taxi_app_icons.dart';
import 'package:transiter_driver/ui/common/text_style.dart';
import 'package:transiter_driver/ui/common/themes.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';
import 'package:transiter_driver/ui/extensions/trip_details_extension.dart';
import 'package:transiter_driver/ui/shared_widgets/dumb_widgets/cached_image_widget.dart';

import 'new_trip_viewmodel.dart';

class NewTripView extends StackedView<NewTripViewModel> {
  final TripDetailsModel tripDetails;

  const NewTripView({Key? key, required this.tripDetails}) : super(key: key);

  @override
  Future<void> onViewModelReady(NewTripViewModel viewModel) async {
    viewModel.getDriverInfo();
    await viewModel.loadMapStyles();
  }

  // switch Dark / Light Mode of Google Map
  Future setMapStyle() async {}

  @override
  Widget builder(
    BuildContext context,
    NewTripViewModel viewModel,
    Widget? child,
  ) {
    ImageConfiguration imageConfiguration =
        createLocalImageConfiguration(context, size: const Size(2, 2));

    GoogleMapController rideMapController;
    late final GoogleMapController _controller;

    viewModel.createMarker(imageConfiguration);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            padding: EdgeInsets.only(bottom: viewModel.mapPaddingBottom),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: true,
            zoomControlsEnabled: false,
            trafficEnabled: true,
            mapType: MapType.normal,
            circles: viewModel.circles,
            markers: viewModel.markers,
            polylines: viewModel.polyLines,
            initialCameraPosition: viewModel.googlePlex,
            onMapCreated: (GoogleMapController controller) async {
              // _controller.complete(controller);
              rideMapController = controller;
              viewModel.setMapPaddingBottom = 260;
              _controller = controller;
              if (isDarkMode(context)) {
                _controller.setMapStyle(viewModel.darkMapStyle);
              } else {
                controller.setMapStyle(viewModel.lightMapStyle);
              }

              // var currentLatLng =
              //     LatLng(currentPosition.latitude, currentPosition.longitude);
              var pickupLatLng = tripDetails.pickup;
              // await getDirection(currentLatLng, pickupLatLng);
              var currentLatLng = await viewModel.currentPosition;
              final success = await viewModel.getDirection(
                  pickup: currentLatLng, destination: pickupLatLng ?? []);
              if (!success) {
                return;
              }
              rideMapController.animateCamera(viewModel.updateLatLngBounds());

              await viewModel.getLocationUpdates([0.0, 0.0]);
              // r
              rideMapController.animateCamera(viewModel.cameraUpdate);
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: isDarkMode(context) ? kcDark : kcWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15.0,
                    spreadRadius: 0.5,
                    offset: Offset(
                      0.7,
                      0.7,
                    ),
                  )
                ],
              ),
              height: 370,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: kcGreen,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        horizontalSpace(6),
                        Text(
                          "Arrived in -   ",
                          textAlign: TextAlign.center,
                          style: ktsBoldText22,
                        ),
                        Text(
                          viewModel.durationString,
                          style: ktsNormaltext16.copyWith(
                              fontSize: 18, color: kcGrey),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    const Divider(),
                    verticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            ClipRRect(
                              child: CachedNetworkImageWidget(
                                imageUrl: tripDetails.photoOfRider,
                                height: 50.h,
                                width: 50.w,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            horizontalSpace(15),
                            Text(
                              tripDetails.nameOfRider,
                              style: ktsBoldText22,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            // launch driver phone number
                            var phone = "tel:${tripDetails.tripRiderPhone}";
                            viewModel.openPhone(phone);
                          },
                          child: SvgPicture.asset(
                            callIcon,
                            height: 25.h,
                            width: 25.w,
                            theme: SvgTheme(
                              currentColor:
                                  isDarkMode(context) ? kcGreen : kcDark,
                            ),
                          ),
                        )
                      ],
                    ),
                    verticalSpaceMedium,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                pickIcon,
                                theme: SvgTheme(
                                  currentColor:
                                      isDarkMode(context) ? kcWhite : kcDark,
                                ),
                              ),
                              verticalSpaceSmall,
                              Flexible(
                                child: Text(
                                  tripDetails.tripPickupAddress,
                                  style: ktsBoldText16.copyWith(color: kcGrey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceTiny,
                        Padding(
                          padding: const EdgeInsets.only(left: 1.2),
                          child: Column(
                            children: [
                              Container(
                                height: 4,
                                width: 2,
                                margin: EdgeInsets.only(left: 15.w),
                                decoration: BoxDecoration(
                                  color: isDarkMode(context) ? kcWhite : kcDark,
                                ),
                              ),
                              verticalSpace(3),
                              Container(
                                height: 4,
                                width: 2,
                                margin: EdgeInsets.only(left: 15.w),
                                decoration: BoxDecoration(
                                  color: isDarkMode(context) ? kcWhite : kcDark,
                                ),
                              ),
                              verticalSpace(3),
                              Container(
                                height: 4,
                                width: 2,
                                margin: const EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  color: isDarkMode(context) ? kcWhite : kcDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceTiny,
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                destIcon,
                                height: 24,
                                width: 24,
                                theme: SvgTheme(
                                  currentColor:
                                      isDarkMode(context) ? kcWhite : kcDark,
                                ),
                              ),
                              verticalSpaceSmall,
                              Flexible(
                                child: Text(
                                  tripDetails.tripDestinationAddress,
                                  style:
                                      ktsNormaltext16.copyWith(color: kcGrey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            personIcon,
                            height: 25,
                            width: 25,
                            theme: SvgTheme(
                              currentColor:
                                  isDarkMode(context) ? kcWhite : kcDark,
                            ),
                          ),
                          verticalSpaceSmall,
                          Text(
                            tripDetails.passengerNumber,
                            style: ktsNormaltext16.copyWith(color: kcGrey),
                          )
                        ],
                      ),
                    ),
                    verticalSpace(30),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if (viewModel.status == 'accepted') {
                            viewModel.setStatus = 'arrived';
                            // rideRef.child('status').set(('arrived'));

                            viewModel.setButtonTitle = 'START TRIP';
                            viewModel.setButtonColor = kcDarkLight;

                            viewModel.showProgressDialog();

                            await viewModel.getDirection(
                              pickup: tripDetails.pickup ?? [],
                              destination: tripDetails.destination ?? [],
                            );

                            Navigator.pop(context);
                          } else if (viewModel.status == 'arrived') {
                            viewModel.setStatus = 'ontrip';
                            // rideRef.child('status').set('ontrip');

                            viewModel.setButtonTitle = 'END TRIP';
                            viewModel.setButtonColor = kcPink;

                            viewModel.startTimer();
                          } else if (viewModel.status == 'ontrip') {
                            viewModel.endTrip(tripDetails: tripDetails);
                          }
                        },
                        child: Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: viewModel.buttonColor,
                          ),
                          child: Center(
                            child: Text(
                              viewModel.buttonTitle,
                              style: ktsBoldText18.copyWith(
                                color: kcWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  NewTripViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NewTripViewModel();
}
