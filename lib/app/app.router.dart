// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;
import 'package:transiter_driver/models/tripdetails.dart' as _i13;
import 'package:transiter_driver/ui/views/about_us/about_us_view.dart' as _i3;
import 'package:transiter_driver/ui/views/add_phone_number/add_phone_number_view.dart'
    as _i4;
import 'package:transiter_driver/ui/views/contact_us/contact_us_view.dart'
    as _i5;
import 'package:transiter_driver/ui/views/how_it_works/how_it_works_view.dart'
    as _i6;
import 'package:transiter_driver/ui/views/main_page/main_page_view.dart' as _i7;
import 'package:transiter_driver/ui/views/my_trips/my_trips_view.dart' as _i11;
import 'package:transiter_driver/ui/views/new_trip/new_trip_view.dart' as _i10;
import 'package:transiter_driver/ui/views/splash_screen/splash_screen_view.dart'
    as _i9;
import 'package:transiter_driver/ui/views/startup/startup_view.dart' as _i2;
import 'package:transiter_driver/ui/views/vehicle_info/vehicle_info_view.dart'
    as _i8;

class Routes {
  static const startupView = '/startup-view';

  static const aboutUsView = '/about-us-view';

  static const addPhoneNumberView = '/add-phone-number-view';

  static const contactUsView = '/contact-us-view';

  static const howItWorksView = '/how-it-works-view';

  static const mainPageView = '/main-page-view';

  static const vehicleInfoView = '/vehicle-info-view';

  static const splashScreenView = '/splash-screen-view';

  static const newTripView = '/new-trip-view';

  static const myTripsView = '/my-trips-view';

  static const all = <String>{
    startupView,
    aboutUsView,
    addPhoneNumberView,
    contactUsView,
    howItWorksView,
    mainPageView,
    vehicleInfoView,
    splashScreenView,
    newTripView,
    myTripsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.aboutUsView,
      page: _i3.AboutUsView,
    ),
    _i1.RouteDef(
      Routes.addPhoneNumberView,
      page: _i4.AddPhoneNumberView,
    ),
    _i1.RouteDef(
      Routes.contactUsView,
      page: _i5.ContactUsView,
    ),
    _i1.RouteDef(
      Routes.howItWorksView,
      page: _i6.HowItWorksView,
    ),
    _i1.RouteDef(
      Routes.mainPageView,
      page: _i7.MainPageView,
    ),
    _i1.RouteDef(
      Routes.vehicleInfoView,
      page: _i8.VehicleInfoView,
    ),
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i9.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.newTripView,
      page: _i10.NewTripView,
    ),
    _i1.RouteDef(
      Routes.myTripsView,
      page: _i11.MyTripsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.AboutUsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.AboutUsView(),
        settings: data,
      );
    },
    _i4.AddPhoneNumberView: (data) {
      final args = data.getArgs<AddPhoneNumberViewArguments>(
        orElse: () => const AddPhoneNumberViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i4.AddPhoneNumberView(key: args.key),
        settings: data,
      );
    },
    _i5.ContactUsView: (data) {
      final args = data.getArgs<ContactUsViewArguments>(
        orElse: () => const ContactUsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i5.ContactUsView(key: args.key),
        settings: data,
      );
    },
    _i6.HowItWorksView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.HowItWorksView(),
        settings: data,
      );
    },
    _i7.MainPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.MainPageView(),
        settings: data,
      );
    },
    _i8.VehicleInfoView: (data) {
      final args = data.getArgs<VehicleInfoViewArguments>(
        orElse: () => const VehicleInfoViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i8.VehicleInfoView(key: args.key),
        settings: data,
      );
    },
    _i9.SplashScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.SplashScreenView(),
        settings: data,
      );
    },
    _i10.NewTripView: (data) {
      final args = data.getArgs<NewTripViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.NewTripView(key: args.key, tripDetails: args.tripDetails),
        settings: data,
      );
    },
    _i11.MyTripsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.MyTripsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AddPhoneNumberViewArguments {
  const AddPhoneNumberViewArguments({this.key});

  final _i12.Key? key;
}

class ContactUsViewArguments {
  const ContactUsViewArguments({this.key});

  final _i12.Key? key;
}

class VehicleInfoViewArguments {
  const VehicleInfoViewArguments({this.key});

  final _i12.Key? key;
}

class NewTripViewArguments {
  const NewTripViewArguments({
    this.key,
    required this.tripDetails,
  });

  final _i12.Key? key;

  final _i13.TripDetailsModel tripDetails;
}

extension NavigatorStateExtension on _i14.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAboutUsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.aboutUsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddPhoneNumberView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addPhoneNumberView,
        arguments: AddPhoneNumberViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContactUsView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.contactUsView,
        arguments: ContactUsViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHowItWorksView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.howItWorksView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVehicleInfoView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.vehicleInfoView,
        arguments: VehicleInfoViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNewTripView({
    _i12.Key? key,
    required _i13.TripDetailsModel tripDetails,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.newTripView,
        arguments: NewTripViewArguments(key: key, tripDetails: tripDetails),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyTripsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myTripsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAboutUsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.aboutUsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddPhoneNumberView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addPhoneNumberView,
        arguments: AddPhoneNumberViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithContactUsView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.contactUsView,
        arguments: ContactUsViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHowItWorksView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.howItWorksView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVehicleInfoView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.vehicleInfoView,
        arguments: VehicleInfoViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNewTripView({
    _i12.Key? key,
    required _i13.TripDetailsModel tripDetails,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.newTripView,
        arguments: NewTripViewArguments(key: key, tripDetails: tripDetails),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyTripsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myTripsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
