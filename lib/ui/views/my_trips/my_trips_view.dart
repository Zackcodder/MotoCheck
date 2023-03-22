// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/taxi_app_icons.dart';
import 'package:transiter_driver/ui/common/text_style.dart';
import 'package:transiter_driver/ui/common/themes.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';
import 'package:transiter_driver/ui/shared_widgets/dumb_widgets/cached_image_widget.dart';

import '../../common/app_strings.dart';
import 'my_trips_viewmodel.dart';

class MyTripsView extends StackedView<MyTripsViewModel> {
  const MyTripsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyTripsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 30,
                          )),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        ksMyTripHeader,
                        style: fugazTextStyle(fontSize: 35.sp),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 0.0,
                                  child: Container(
                                    margin: EdgeInsets.zero,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              ksDeleteAllTripHeader,
                                              style: ktsBoldText22,
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Divider(),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                ksDeleteAllTripConfirmMsg,
                                                textAlign: TextAlign.center,
                                                style: ktsNormaltext14.copyWith(
                                                    color: kcGrey),
                                              ),
                                            ),
                                            verticalSpace(30),
                                            GestureDetector(
                                              onTap: () {
                                                // reference
                                                //     .child(currentFirebaseUser
                                                //         .currentUser.uid)
                                                //     .child("myTrips")
                                                //     .remove()
                                                //     .whenComplete(() =>
                                                //         Navigator.pop(context));

                                                // setState(() {
                                                //   checkEmptyList();
                                                // });
                                              },
                                              child: Container(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: kcPink,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      deleteIcon,
                                                      height: 20,
                                                      width: 20,
                                                      theme: const SvgTheme(
                                                          currentColor: kcPink),
                                                    ),
                                                    verticalSpaceSmall,
                                                    Text(
                                                      ksDeleteLabel,
                                                      style: ktsBoldText18
                                                          .copyWith(
                                                              color: kcPink),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            verticalSpaceSmall,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                      },
                      child: SvgPicture.asset(
                        deleteIcon,
                        height: 25,
                        width: 25,
                        theme: SvgTheme(
                            currentColor:
                                isDarkMode(context) ? kcWhite : kcDark),
                      )),
                ],
              ),
              verticalSpace(20),
              // dataSnapshot?.value == null
              true
                  ? Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        ksNoTripMsg,
                        style: ktsNormaltext16.copyWith(color: kcGrey),
                      ),
                    )
                  : Expanded(
                      child: Container(
                          // child: FirebaseAnimatedList(
                          //   query: ref,
                          //   shrinkWrap: true,
                          //   padding: EdgeInsets.all(12),
                          //   itemBuilder: (BuildContext context,
                          //       DataSnapshot snapshot,
                          //       Animation<double> animation,
                          //       int index) {
                          //     var tripData = snapshot.value;
                          //     tripData['key'] = snapshot.key;
                          //     return Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Container(
                          //           width: 130,
                          //           margin: EdgeInsets.only(left: 10),
                          //           child: Center(
                          //             child: Text(
                          //               "${tripData["created_at"].toString().substring(0, 16)}",
                          //               style: ktsNormaltext16,
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: 10,
                          //         ),
                          //         cardItem(context, tripData),
                          //       ],
                          //     );
                          //   },
                          // ),
                          ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  MyTripsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyTripsViewModel();

  Widget cardItem(context, Map tripData) {
    return Container(
      height: 240,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: isDarkMode(context) ? kcDarkLight : kcWhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 3), blurRadius: 20)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: CachedNetworkImageWidget(
                      imageUrl: tripData[ksRiderPhoto],
                      height: 50,
                      width: 50,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  verticalSpaceSmall,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tripData[ksRiderName].toString(),
                        style: ktsBoldText18,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            star,
                            height: 18,
                            width: 18,
                            theme: const SvgTheme(currentColor: kcYellow),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "4.5",
                            style: ktsBoldText15.copyWith(color: kcGrey),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(ksTripCost,
                      style: ktsNormaltext12.copyWith(color: kcGrey)),
                  Text(
                    "US" "\$${tripData["tripCost"]}",
                    style: ktsBoldText23.copyWith(
                        color: isDarkMode(context) ? kcGreen : kcDark),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Row(
              children: [
                SvgPicture.asset(
                  pickIcon,
                  theme: SvgTheme(
                    currentColor: isDarkMode(context) ? Colors.white : kcDark,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  tripData[ksPickUpAddress].toString(),
                  style: ktsNormaltext14.copyWith(color: kcGrey),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 4,
            width: 2,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: isDarkMode(context) ? Colors.white : kcDark,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            height: 4,
            width: 2,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: isDarkMode(context) ? Colors.white : kcDark,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            height: 4,
            width: 2,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: isDarkMode(context) ? Colors.white : kcDark,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.5),
            child: Row(
              children: [
                SvgPicture.asset(
                  destIcon,
                  height: 24,
                  width: 24,
                  theme: SvgTheme(
                    currentColor: isDarkMode(context) ? Colors.white : kcDark,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  tripData[ksDestinationAddress].toString(),
                  style: ktsNormaltext14.copyWith(color: kcGrey),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.5),
            child: Row(
              children: [
                SvgPicture.asset(
                  personIcon,
                  height: 23,
                  width: 23,
                  theme: SvgTheme(
                    currentColor: isDarkMode(context) ? Colors.white : kcDark,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  tripData[ksPassengerNumber].toString(),
                  style: ktsNormaltext16.copyWith(color: kcGrey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
