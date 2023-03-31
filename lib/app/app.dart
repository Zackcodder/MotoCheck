import 'package:stacked_themes/stacked_themes.dart';
import 'package:transiter_driver/ui/bottom_sheets/notice/confirm_sheet/confirm_sheet.dart';
import 'package:transiter_driver/ui/dialogs/collect_payment/collect_payment_dialog.dart';
import 'package:transiter_driver/ui/dialogs/notification/notification_dialog.dart';
import 'package:transiter_driver/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:transiter_driver/ui/views/about_us/about_us_view.dart';
import 'package:transiter_driver/services/url_launcher_service.dart';
import 'package:transiter_driver/ui/views/add_phone_number/add_phone_number_view.dart';
import 'package:transiter_driver/ui/views/contact_us/contact_us_view.dart';
import 'package:transiter_driver/ui/views/how_it_works/how_it_works_view.dart';
import 'package:transiter_driver/ui/views/main_page/main_page_view.dart';
import 'package:transiter_driver/ui/views/vehicle_info/vehicle_info_view.dart';
import 'package:transiter_driver/ui/views/splash_screen/splash_screen_view.dart';
import 'package:transiter_driver/ui/views/new_trip/new_trip_view.dart';
import 'package:transiter_driver/services/google_map_service.dart';
import 'package:transiter_driver/services/geo_location_service.dart';
import 'package:transiter_driver/ui/dialogs/progress/progress_dialog.dart';
import 'package:transiter_driver/services/map_service.dart';
import 'package:transiter_driver/services/map_toolkit_service.dart';
import 'package:transiter_driver/services/polyline_points_service.dart';
import 'package:transiter_driver/ui/views/my_trips/my_trips_view.dart';
import 'package:transiter_driver/services/authentication_service.dart';
import 'package:transiter_driver/ui/views/login/login_view.dart';
import 'package:transiter_driver/services/local_storage_service.dart';
import 'package:transiter_driver/services/driver_service.dart';
import 'package:transiter_driver/services/geofire_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: AboutUsView),
    MaterialRoute(page: AddPhoneNumberView),
    MaterialRoute(page: ContactUsView),
    MaterialRoute(page: HowItWorksView),
    MaterialRoute(page: MainPageView),
    MaterialRoute(page: VehicleInfoView),
    MaterialRoute(page: SplashScreenView),
    MaterialRoute(page: NewTripView),
    MaterialRoute(page: MyTripsView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UrlLauncherService),
    LazySingleton(classType: GoogleMapService),
    LazySingleton(classType: GeoLocationService),
    LazySingleton(classType: MapService),
    LazySingleton(classType: MapToolkitService),
    LazySingleton(classType: PolylinePointsService),
    LazySingleton(classType: AuthenticationService),
    Singleton(classType: ThemeService, resolveUsing: ThemeService.getInstance),
    Presolve(
      classType: LocalStorageService,
      presolveUsing: LocalStorageService.getInstance,
    ),
    LazySingleton(classType: DriverService),
    LazySingleton(classType: GeofireService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: ConfirmSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: CollectPaymentDialog),
    StackedDialog(classType: NotificationDialog),
    StackedDialog(classType: ProgressDialog),
// @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}

// flutter pub run build_runner build --delete-conflicting-outputs
