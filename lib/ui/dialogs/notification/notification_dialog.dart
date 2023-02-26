import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transiter_driver/models/tripdetails.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/taxi_app_icons.dart';
import 'package:transiter_driver/ui/common/text_style.dart';
import 'package:transiter_driver/ui/common/themes.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/ui/extensions/string_extension.dart';
import 'package:transiter_driver/ui/extensions/trip_details_extension.dart';
import 'package:transiter_driver/ui/shared_widgets/dumb_widgets/cached_image_widget.dart';

import 'notification_dialog_model.dart';

class NotificationDialog extends StackedView<NotificationDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const NotificationDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationDialogModel viewModel,
    Widget? child,
  ) {
    final TripDetailsModel tripDetails = request.data['tripDetails'];

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0.0,
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: isDarkMode(context) ? kcDark : kcWhiteLite,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 65,
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                color: isDarkMode(context) ? kcDarkLight : Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        carIcon,
                        height: 35,
                        width: 35,
                      ),
                      horizontalSpaceSmall,
                      Text(
                        "NEW TRIP",
                        style: ktsBoldText18,
                      )
                    ],
                  ),
                  Text(
                    "Now",
                    style: ktsBoldText16.copyWith(color: kcGreen),
                  )
                ],
              ),
            ),
            verticalSpace(20),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        child: CachedNetworkImageWidget(
                          imageUrl: tripDetails.riderPhoto ?? '',
                          height: 50,
                          width: 50,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      horizontalSpaceSmall,
                      Text(
                        tripDetails.nameOfRider,
                        style: ktsBoldText18,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Trip Cost",
                        style: ktsNormaltext12.copyWith(color: kcGrey),
                      ),
                      Text(
                        tripDetails.costOfTrip.formatCurrency(),
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: isDarkMode(context) ? kcGreen : kcDark,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
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
                                isDarkMode(context) ? Colors.white : kcDark,
                          ),
                        ),
                        verticalSpaceSmall,
                        Flexible(
                          child: Text(
                            tripDetails.tripPickupAddress,
                            style: ktsNormaltext16.copyWith(color: kcGrey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpaceTiny,
                  Padding(
                    padding: EdgeInsets.only(left: 1.2.w),
                    child: Column(
                      children: [
                        Container(
                          height: 4,
                          width: 2,
                          margin: EdgeInsets.only(left: 15.w),
                          decoration: BoxDecoration(
                            color: isDarkMode(context) ? Colors.white : kcDark,
                          ),
                        ),
                        verticalSpace(3),
                        Container(
                          height: 4,
                          width: 2,
                          margin: EdgeInsets.only(left: 15.w),
                          decoration: BoxDecoration(
                            color: isDarkMode(context) ? Colors.white : kcDark,
                          ),
                        ),
                        verticalSpace(3),
                        Container(
                          height: 4,
                          width: 2,
                          margin: EdgeInsets.only(left: 15.w),
                          decoration: BoxDecoration(
                            color: isDarkMode(context) ? Colors.white : kcDark,
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
                                isDarkMode(context) ? Colors.white : kcDark,
                          ),
                        ),
                        horizontalSpaceSmall,
                        Flexible(
                          child: Text(
                            tripDetails.tripDestinationAddress,
                            style: ktsNormaltext16.copyWith(color: kcGrey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  SvgPicture.asset(
                    personIcon,
                    height: 25,
                    width: 25,
                    theme: SvgTheme(
                      currentColor: isDarkMode(context) ? Colors.white : kcDark,
                    ),
                  ),
                  horizontalSpaceSmall,
                  Text(
                    tripDetails.passengerNumber,
                    style: ktsNormaltext16.copyWith(color: kcGrey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            verticalSpace(30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // assetsAudioPlayer.stop();
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isDarkMode(context) ? Colors.white : kcDark,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: ktsBoldText18.copyWith(
                              color:
                                  isDarkMode(context) ? Colors.white : kcDark,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // assetsAudioPlayer.stop();
                        checkAvailablity(context);
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: isDarkMode(context) ? kcDarkLight : kcDark,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Accept",
                            style: ktsBoldText18.copyWith(color: kcWhite),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            verticalSpaceMedium,
          ],
        ),
      ),
    );
  }

  @override
  NotificationDialogModel viewModelBuilder(BuildContext context) =>
      NotificationDialogModel();

  void checkAvailablity(context) {
    //show please wait dialog
    // showDialog(
    //   barrierDismissible: false,
    //   context: context,
    //   builder: (BuildContext context) => ProgressDialog(
    //     status: 'Accepting request',
    //   ),
    // );

    // DatabaseReference newRideRef = FirebaseDatabase.instance
    //     .reference()
    //     .child('driver_users/${currentFirebaseUser.currentUser.uid}/newtrip');
    // newRideRef.once().then((DataSnapshot snapshot) {
    //   Navigator.pop(context);
    //   Navigator.pop(context);

    //   String thisRideID = "";
    //   if (snapshot.value != null) {
    //     thisRideID = snapshot.value.toString();
    //   } else {
    //     // Toast.show("Ride not found", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    //   }

    //   if (thisRideID == tripDetails.rideID) {
    //     newRideRef.set('accepted');
    //     HelperMethods.disableHomTabLocationUpdates();
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => NewTripPage(
    //             tripDetails: tripDetails,
    //           ),
    //         ));
    //   } else if (thisRideID == 'cancelled') {
    //     // Toast.show("Ride has been cancelled", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    //   } else if (thisRideID == 'timeout') {
    //     // Toast.show("Ride has timed out", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    //   } else {
    //     // Toast.show("Ride not found", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    //   }
    // });
  }
}
