import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/app_strings.dart';
import 'package:transiter_driver/ui/common/taxi_app_icons.dart';
import 'package:transiter_driver/ui/common/themes.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';
import 'package:transiter_driver/ui/extensions/driver_model_extension.dart';
import 'package:transiter_driver/ui/shared_widgets/dumb_widgets/cached_image_widget.dart';

import 'main_page_viewmodel.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller = Completer();

  // switch Dark / Light Mode of Google Map
  Future setMapStyle(BuildContext context, model) async {
    final controller = await _controller.future;
    // ignore: use_build_context_synchronously
    if (isDarkMode(context)) {
      controller.setMapStyle(model.darkMapStyle);
    } else {
      controller.setMapStyle(model.lightMapStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainPageViewModel>.reactive(
      onViewModelReady: (viewModel) async {
        await viewModel.init();
        await viewModel.loadMapStyles();
        // await viewModel.getLocationUpdates();
        await viewModel.fetchDriverDetails();
      },
      viewModelBuilder: () => MainPageViewModel(),
      builder: (context, viewModel, child) {
        setMapStyle(context, viewModel);
        // Completer<GoogleMapController> _controller = Completer();
        return Scaffold(
          // key: scaffoldKey,
          drawer: Container(
            width: 280,
            color: kcWhiteBackground,
            child: Drawer(
              child: Container(
                color: isDarkMode(context) ? kcDark : kcWhite,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      color: isDarkMode(context) ? kcDark : kcWhite,
                      height: 160,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          color: isDarkMode(context) ? kcDark : kcWhite,
                        ),
                        child: Row(
                          children: <Widget>[
                            CachedNetworkImageWidget(
                              imageUrl: viewModel.driver
                                  .driverPhotoUrl, // 'currentFirebaseUser.currentUser.photoURL',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(
                                backgroundColor: kcDarkLight,
                              ),
                              height: 60,
                              width: 60,
                            ),
                            horizontalSpace(15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 160,
                                  child: Text(
                                    viewModel.driver
                                        .fullName, //  currentFirebaseUser.currentUser.displayName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontSize: 20.sp),
                                  ),
                                ),
                                verticalSpaceTiny,
                                const Text(
                                  ksIAmADriver,
                                  // style: GoogleFonts.lato(color: kcGrey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    verticalSpaceSmall,
                    ListTile(
                      leading: SvgPicture.asset(
                        carIcon,
                        height: 28,
                        width: 28,
                        colorFilter:
                            const ColorFilter.mode(kcGrey, BlendMode.srcIn),
                      ),
                      title: Text(
                        ksMyTrips,
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: isDarkMode(context) ? kcWhite : kcDark,
                                ),
                      ),
                      onTap: () {
                        viewModel.nToMyTrips();
                        // Navigator.pushNamed(context, ' MyTripsPage.id');
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        help,
                        height: 25,
                        width: 25,
                        colorFilter:
                            const ColorFilter.mode(kcGrey, BlendMode.srcIn),
                      ),
                      title: Text(
                        ksHowItWorks,
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: isDarkMode(context) ? kcWhite : kcDark,
                                ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, ' HowItWorkPage.id');
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        contactUsIcon,
                        height: 28,
                        width: 28,
                        colorFilter:
                            const ColorFilter.mode(kcGrey, BlendMode.srcIn),
                      ),
                      title: Text(
                        ksContactUs,
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: isDarkMode(context) ? kcWhite : kcDark,
                                ),
                      ),
                      onTap: () {
                        // Navigator.pushNamed(context, ContactUsPage.id);
                      },
                    ),
                    verticalSpace(40),
                    ListTile(
                      leading: SvgPicture.asset(
                        signOutIcon,
                        height: 28,
                        width: 28,
                        colorFilter:
                            const ColorFilter.mode(kcPink, BlendMode.srcIn),
                      ),
                      title: Text(
                        ksSignOut,
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: isDarkMode(context) ? kcWhite : kcDark,
                                ),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 0.0,
                                  child: Container(
                                    margin: const EdgeInsets.all(0),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              ksSignOut,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall!,
                                            ),
                                            verticalSpace(15),
                                            // BrandDivider(),
                                            verticalSpace(15),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                ksAreYouSureYouWantToSignout,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            verticalSpace(30),

                                            GestureDetector(
                                              onTap: () async {
                                                await viewModel.signOut();
                                                // signOut();
                                                // signOutGoogle();
                                                // Navigator.pop(context);
                                                // Navigator.pushNamedAndRemoveUntil(
                                                //     context,
                                                //     SplashScreen.id,
                                                //     (route) => false);
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
                                                      width: 2, color: kcPink),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      signOutIcon,
                                                      height: 20,
                                                      width: 20,
                                                      colorFilter:
                                                          const ColorFilter
                                                                  .mode(kcPink,
                                                              BlendMode.srcIn),
                                                    ),
                                                    verticalSpaceSmall,
                                                    Text(
                                                      ksSignOut,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            children: <Widget>[
              GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                circles: viewModel.circles,
                initialCameraPosition: viewModel.googlePlex,
                onMapCreated: (GoogleMapController controller) async {
                  mapController = controller;
                  _controller.complete(controller);

                  mapController.setMapStyle(viewModel.lightMapStyle);

                  final position = await viewModel.currentPosition;

                  mapController.animateCamera(CameraUpdate.newLatLng(
                      viewModel.convertPositionToLatLng(position)));
                },
              ),

              ///Switch Theme Mode Button
              Positioned(
                top: 45,
                right: 20,
                child: GestureDetector(
                  onTap: () async {
                    viewModel.changeTheme();
                    // switch Theme dark / light
                    // setState(() {
                    //   themeProvider.swapTheme();
                    // });
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: isDarkMode(context) ? kcDark : kcWhite,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26.withOpacity(0.1),
                                blurRadius: 5.0,
                                spreadRadius: 0.5,
                                offset: const Offset(
                                  0.7,
                                  0.7,
                                ))
                          ]),
                      child: SvgPicture.asset(
                        isDarkMode(context) ? light : dark,
                        colorFilter: ColorFilter.mode(
                            isDarkMode(context) ? kcWhite : kcDark,
                            BlendMode.srcIn),
                      )),
                ),
              ),

              /// MenuButton
              Positioned(
                top: 40,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    // scaffoldKey.currentState.openDrawer();
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: kcWhite,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26.withOpacity(0.1),
                              blurRadius: 5.0,
                              spreadRadius: 0.5,
                              offset: const Offset(
                                0.7,
                                0.7,
                              ))
                        ]),
                    child: CircleAvatar(
                        backgroundColor: kcWhite,
                        child: CachedNetworkImageWidget(
                          imageUrl: viewModel.driver
                              .driverPhotoUrl, //'currentFirebaseUser.currentUser.photoURL',
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(
                            backgroundColor: kcDarkLight,
                          ),
                          height: 60,
                          width: 60,
                        )),
                  ),
                ),
              ),

              /// OnlineButton
              Positioned(
                bottom: 40,
                right: 20,
                left: 20,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (viewModel.isBusy) {
                          return;
                        }
                        final success =
                            await viewModel.showUpdateStatusBottomSheet();
                        if (success) {
                          viewModel.getPositionStream.listen((position) async {
                            if (viewModel.isOnline) {
                              await viewModel.geofireGoOnline;
                            }
                            await viewModel.locationUpdates(position);
                            mapController.animateCamera(viewModel.cameraUpdate);
                          });
                        }
                      },
                      child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                              color: viewModel.isBusy
                                  ? kcGrey
                                  : viewModel.isOnline
                                      ? kcOnlineColor
                                      : kcOfflineColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: viewModel.isBusy
                                        ? kcGrey.withOpacity(0.3)
                                        : viewModel.isOnline
                                            ? kcOnlineColor.withOpacity(0.3)
                                            : kcOfflineColor.withOpacity(0.3),
                                    offset: const Offset(0, 10),
                                    blurRadius: 20)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                carIcon,
                                colorFilter: const ColorFilter.mode(
                                    kcWhite, BlendMode.srcIn),
                              ),
                              verticalSpace(20),
                              Text(
                                viewModel.isOnline ? ksOnline : ksOffline,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      color: kcWhite,
                                    ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
