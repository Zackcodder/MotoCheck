// Mocks generated by Mockito 5.4.0 from annotations
// in transiter_driver/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:ui' as _i8;

import 'package:flutter/material.dart' as _i6;
import 'package:flutter_polyline_points/flutter_polyline_points.dart' as _i3;
import 'package:geolocator/geolocator.dart' as _i11;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;
import 'package:transiter_driver/services/authentication_service.dart' as _i16;
import 'package:transiter_driver/services/driver_service.dart' as _i18;
import 'package:transiter_driver/services/geo_location_service.dart' as _i12;
import 'package:transiter_driver/services/geofire_service.dart' as _i19;
import 'package:transiter_driver/services/google_map_service.dart' as _i10;
import 'package:transiter_driver/services/local_storage_service.dart' as _i17;
import 'package:transiter_driver/services/map_service.dart' as _i13;
import 'package:transiter_driver/services/map_toolkit_service.dart' as _i14;
import 'package:transiter_driver/services/polyline_points_service.dart' as _i15;
import 'package:transiter_driver/services/url_launcher_service.dart' as _i9;
import 'package:transiter_driver/ui/common/api_handlers/transiter_api.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCameraPosition_0 extends _i1.SmartFake
    implements _i2.CameraPosition {
  _FakeCameraPosition_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCameraUpdate_1 extends _i1.SmartFake implements _i2.CameraUpdate {
  _FakeCameraUpdate_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePolylinePoints_2 extends _i1.SmartFake
    implements _i3.PolylinePoints {
  _FakePolylinePoints_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTransiterApiHandler_3 extends _i1.SmartFake
    implements _i4.TransiterApiHandler {
  _FakeTransiterApiHandler_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i5.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i6.GlobalKey<_i6.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i6.GlobalKey<_i6.NavigatorState>?);
  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i5.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<T?>? navigateWithTransition<T>(
    _i6.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i6.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i5.Transition? transitionClass,
    _i5.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? replaceWithTransition<T>(
    _i6.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i6.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i5.Transition? transitionClass,
    _i5.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void popUntil(
    _i6.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i6.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? navigateToView<T>(
    _i6.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i6.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i5.Transition? transition,
    _i5.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i6.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? clearStackAndShowView<T>(
    _i6.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? clearTillFirstAndShowView<T>(
    _i6.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i6.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i5.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i5.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<_i5.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i7.Future<_i5.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i7.Future<_i5.SheetResponse<dynamic>?>.value(),
      ) as _i7.Future<_i5.SheetResponse<dynamic>?>);
  @override
  _i7.Future<_i5.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i8.Color? barrierColor = const _i8.Color(2315255808),
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i7.Future<_i5.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i7.Future<_i5.SheetResponse<T>?>.value(),
      ) as _i7.Future<_i5.SheetResponse<T>?>);
  @override
  void completeSheet(_i5.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i5.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i5.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i6.Widget Function(
      _i6.BuildContext,
      _i5.DialogRequest<dynamic>,
      dynamic Function(_i5.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<_i5.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i8.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i8.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i5.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i7.Future<_i5.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i7.Future<_i5.DialogResponse<dynamic>?>.value(),
      ) as _i7.Future<_i5.DialogResponse<dynamic>?>);
  @override
  _i7.Future<_i5.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i8.Color? barrierColor = const _i8.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i7.Future<_i5.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i7.Future<_i5.DialogResponse<T>?>.value(),
      ) as _i7.Future<_i5.DialogResponse<T>?>);
  @override
  _i7.Future<_i5.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    String? confirmationTitle = r'Ok',
    bool? barrierDismissible = false,
    _i5.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #confirmationTitle: confirmationTitle,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i7.Future<_i5.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i7.Future<_i5.DialogResponse<dynamic>?>.value(),
      ) as _i7.Future<_i5.DialogResponse<dynamic>?>);
  @override
  void completeDialog(_i5.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [UrlLauncherService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUrlLauncherService extends _i1.Mock
    implements _i9.UrlLauncherService {
  @override
  _i7.Future<bool> openUrl(String? url) => (super.noSuchMethod(
        Invocation.method(
          #openUrl,
          [url],
        ),
        returnValue: _i7.Future<bool>.value(false),
        returnValueForMissingStub: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  dynamic openPhone(String? url) => super.noSuchMethod(
        Invocation.method(
          #openPhone,
          [url],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [GoogleMapService].
///
/// See the documentation for Mockito's code generation for more information.
class MockGoogleMapService extends _i1.Mock implements _i10.GoogleMapService {
  @override
  set movingMarkerIcon(_i2.BitmapDescriptor? _movingMarkerIcon) =>
      super.noSuchMethod(
        Invocation.setter(
          #movingMarkerIcon,
          _movingMarkerIcon,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set cameraPosition(_i2.CameraPosition? _cameraPosition) => super.noSuchMethod(
        Invocation.setter(
          #cameraPosition,
          _cameraPosition,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set bounds(_i2.LatLngBounds? _bounds) => super.noSuchMethod(
        Invocation.setter(
          #bounds,
          _bounds,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.CameraPosition get googlePlex => (super.noSuchMethod(
        Invocation.getter(#googlePlex),
        returnValue: _FakeCameraPosition_0(
          this,
          Invocation.getter(#googlePlex),
        ),
        returnValueForMissingStub: _FakeCameraPosition_0(
          this,
          Invocation.getter(#googlePlex),
        ),
      ) as _i2.CameraPosition);
  @override
  _i2.CameraUpdate get cameraUpdate => (super.noSuchMethod(
        Invocation.getter(#cameraUpdate),
        returnValue: _FakeCameraUpdate_1(
          this,
          Invocation.getter(#cameraUpdate),
        ),
        returnValueForMissingStub: _FakeCameraUpdate_1(
          this,
          Invocation.getter(#cameraUpdate),
        ),
      ) as _i2.CameraUpdate);
  @override
  _i2.CameraUpdate get latLngBoundsUpdate => (super.noSuchMethod(
        Invocation.getter(#latLngBoundsUpdate),
        returnValue: _FakeCameraUpdate_1(
          this,
          Invocation.getter(#latLngBoundsUpdate),
        ),
        returnValueForMissingStub: _FakeCameraUpdate_1(
          this,
          Invocation.getter(#latLngBoundsUpdate),
        ),
      ) as _i2.CameraUpdate);
  @override
  Set<_i2.Circle> mainPageCircles(_i11.Position? pos) => (super.noSuchMethod(
        Invocation.method(
          #mainPageCircles,
          [pos],
        ),
        returnValue: <_i2.Circle>{},
        returnValueForMissingStub: <_i2.Circle>{},
      ) as Set<_i2.Circle>);
  @override
  void createMarker(dynamic imageConfiguration) => super.noSuchMethod(
        Invocation.method(
          #createMarker,
          [imageConfiguration],
        ),
        returnValueForMissingStub: null,
      );
  @override
  dynamic locationUpdateForMainPage({required _i11.Position? position}) =>
      super.noSuchMethod(
        Invocation.method(
          #locationUpdateForMainPage,
          [],
          {#position: position},
        ),
        returnValueForMissingStub: null,
      );
  @override
  dynamic updateCameraPosition(_i11.Position? position) => super.noSuchMethod(
        Invocation.method(
          #updateCameraPosition,
          [position],
        ),
        returnValueForMissingStub: null,
      );
  @override
  dynamic locationUpdates({
    required _i11.Position? position,
    List<dynamic>? oldLatLng,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #locationUpdates,
          [],
          {
            #position: position,
            #oldLatLng: oldLatLng,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  dynamic setPolyLine(List<_i2.LatLng>? polylineCoordinates) =>
      super.noSuchMethod(
        Invocation.method(
          #setPolyLine,
          [polylineCoordinates],
        ),
        returnValueForMissingStub: null,
      );
  @override
  dynamic fitPolyLineToMap({
    required List<dynamic>? pickup,
    required List<dynamic>? destination,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #fitPolyLineToMap,
          [],
          {
            #pickup: pickup,
            #destination: destination,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  dynamic convertPositionToLatLng(_i11.Position? position) =>
      super.noSuchMethod(
        Invocation.method(
          #convertPositionToLatLng,
          [position],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [GeoLocationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockGeoLocationService extends _i1.Mock
    implements _i12.GeoLocationService {
  @override
  set serviceEnabled(bool? _serviceEnabled) => super.noSuchMethod(
        Invocation.setter(
          #serviceEnabled,
          _serviceEnabled,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set permission(_i11.LocationPermission? _permission) => super.noSuchMethod(
        Invocation.setter(
          #permission,
          _permission,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasPermission => (super.noSuchMethod(
        Invocation.getter(#hasPermission),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  dynamic getCurrentPosition({
    bool? forceUseCurrentLocation = true,
    bool? asPosition = true,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #getCurrentPosition,
          [],
          {
            #forceUseCurrentLocation: forceUseCurrentLocation,
            #asPosition: asPosition,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  dynamic nToLocationUnavailable(String? message) => super.noSuchMethod(
        Invocation.method(
          #nToLocationUnavailable,
          [message],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Stream<_i11.Position> getPositionStream() => (super.noSuchMethod(
        Invocation.method(
          #getPositionStream,
          [],
        ),
        returnValue: _i7.Stream<_i11.Position>.empty(),
        returnValueForMissingStub: _i7.Stream<_i11.Position>.empty(),
      ) as _i7.Stream<_i11.Position>);
}

/// A class which mocks [MapService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMapService extends _i1.Mock implements _i13.MapService {
  @override
  _i7.Future<dynamic> getDirections({
    required List<dynamic>? pickup,
    required List<dynamic>? destination,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDirections,
          [],
          {
            #pickup: pickup,
            #destination: destination,
          },
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
}

/// A class which mocks [MapToolkitService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMapToolkitService extends _i1.Mock implements _i14.MapToolkitService {
  @override
  double getMarkerRotation(
    dynamic sourceLat,
    dynamic sourceLng,
    dynamic destinationLat,
    dynamic destinationLng,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMarkerRotation,
          [
            sourceLat,
            sourceLng,
            destinationLat,
            destinationLng,
          ],
        ),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);
}

/// A class which mocks [PolylinePointsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPolylinePointsService extends _i1.Mock
    implements _i15.PolylinePointsService {
  @override
  List<_i2.LatLng> get polylineCoordinates => (super.noSuchMethod(
        Invocation.getter(#polylineCoordinates),
        returnValue: <_i2.LatLng>[],
        returnValueForMissingStub: <_i2.LatLng>[],
      ) as List<_i2.LatLng>);
  @override
  set polylineCoordinates(List<_i2.LatLng>? _polylineCoordinates) =>
      super.noSuchMethod(
        Invocation.setter(
          #polylineCoordinates,
          _polylineCoordinates,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.PolylinePoints get polylinePoints => (super.noSuchMethod(
        Invocation.getter(#polylinePoints),
        returnValue: _FakePolylinePoints_2(
          this,
          Invocation.getter(#polylinePoints),
        ),
        returnValueForMissingStub: _FakePolylinePoints_2(
          this,
          Invocation.getter(#polylinePoints),
        ),
      ) as _i3.PolylinePoints);
  @override
  set polylinePoints(_i3.PolylinePoints? _polylinePoints) => super.noSuchMethod(
        Invocation.setter(
          #polylinePoints,
          _polylinePoints,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i2.LatLng> decodePolyPoints(String? encodedPoints) =>
      (super.noSuchMethod(
        Invocation.method(
          #decodePolyPoints,
          [encodedPoints],
        ),
        returnValue: <_i2.LatLng>[],
        returnValueForMissingStub: <_i2.LatLng>[],
      ) as List<_i2.LatLng>);
}

/// A class which mocks [AuthenticationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationService extends _i1.Mock
    implements _i16.AuthenticationService {
  @override
  _i4.TransiterApiHandler get api => (super.noSuchMethod(
        Invocation.getter(#api),
        returnValue: _FakeTransiterApiHandler_3(
          this,
          Invocation.getter(#api),
        ),
        returnValueForMissingStub: _FakeTransiterApiHandler_3(
          this,
          Invocation.getter(#api),
        ),
      ) as _i4.TransiterApiHandler);
  @override
  dynamic login({
    required String? email,
    required String? password,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #login,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [LocalStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorageService extends _i1.Mock
    implements _i17.LocalStorageService {
  @override
  _i7.Future<String?> get getDriverId => (super.noSuchMethod(
        Invocation.getter(#getDriverId),
        returnValue: _i7.Future<String?>.value(),
        returnValueForMissingStub: _i7.Future<String?>.value(),
      ) as _i7.Future<String?>);
  @override
  _i7.Future<dynamic> setBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> setString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> setDouble(
    String? key,
    num? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDouble,
          [
            key,
            value,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> setStringList(
    String? key,
    List<String>? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setStringList,
          [
            key,
            value,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> setMap(
    String? key,
    Map<dynamic, dynamic>? map,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setMap,
          [
            key,
            map,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> setList(
    String? key,
    List<dynamic>? map,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setList,
          [
            key,
            map,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  bool? getBool(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getBool,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as bool?);
  @override
  String? getString(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getString,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as String?);
  @override
  double? getDouble(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getDouble,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as double?);
  @override
  List<String>? getStringList(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getStringList,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as List<String>?);
  @override
  dynamic getMap(String? key) => super.noSuchMethod(
        Invocation.method(
          #getMap,
          [key],
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<dynamic> getList(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getList,
          [key],
        ),
        returnValue: <dynamic>[],
        returnValueForMissingStub: <dynamic>[],
      ) as List<dynamic>);
  @override
  _i7.Future<bool?> clearData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #clearData,
          [key],
        ),
        returnValue: _i7.Future<bool?>.value(),
        returnValueForMissingStub: _i7.Future<bool?>.value(),
      ) as _i7.Future<bool?>);
  @override
  _i7.Future<bool?> clearStorage() => (super.noSuchMethod(
        Invocation.method(
          #clearStorage,
          [],
        ),
        returnValue: _i7.Future<bool?>.value(),
        returnValueForMissingStub: _i7.Future<bool?>.value(),
      ) as _i7.Future<bool?>);
  @override
  _i7.Future<dynamic> setInt(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInt,
          [
            key,
            value,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  int? getInt(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getInt,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as int?);
}

/// A class which mocks [DriverService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDriverService extends _i1.Mock implements _i18.DriverService {
  @override
  _i4.TransiterApiHandler get api => (super.noSuchMethod(
        Invocation.getter(#api),
        returnValue: _FakeTransiterApiHandler_3(
          this,
          Invocation.getter(#api),
        ),
        returnValueForMissingStub: _FakeTransiterApiHandler_3(
          this,
          Invocation.getter(#api),
        ),
      ) as _i4.TransiterApiHandler);
  @override
  dynamic updateDriverLiveStatus(bool? online) => super.noSuchMethod(
        Invocation.method(
          #updateDriverLiveStatus,
          [online],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [GeofireService].
///
/// See the documentation for Mockito's code generation for more information.
class MockGeofireService extends _i1.Mock implements _i19.GeofireService {
  @override
  _i7.Future<bool> goOnline() => (super.noSuchMethod(
        Invocation.method(
          #goOnline,
          [],
        ),
        returnValue: _i7.Future<bool>.value(false),
        returnValueForMissingStub: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<bool> goOffline() => (super.noSuchMethod(
        Invocation.method(
          #goOffline,
          [],
        ),
        returnValue: _i7.Future<bool>.value(false),
        returnValueForMissingStub: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
}
