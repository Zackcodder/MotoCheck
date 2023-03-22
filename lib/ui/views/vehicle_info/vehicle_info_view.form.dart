// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_strings.dart';

const String CarModelValueKey = ksCarModelTextField;
const String CarColorValueKey = ksCarColorTextField;
const String VehicleNumberValueKey = ksCarNumberTextField;

final Map<String, TextEditingController>
    _VehicleInfoViewTextEditingControllers = {};

final Map<String, FocusNode> _VehicleInfoViewFocusNodes = {};

final Map<String, String? Function(String?)?> _VehicleInfoViewTextValidations =
    {
  CarModelValueKey: null,
  CarColorValueKey: null,
  VehicleNumberValueKey: null,
};

mixin $VehicleInfoView on StatelessWidget {
  TextEditingController get carModelController =>
      _getFormTextEditingController(CarModelValueKey);
  TextEditingController get carColorController =>
      _getFormTextEditingController(CarColorValueKey);
  TextEditingController get vehicleNumberController =>
      _getFormTextEditingController(VehicleNumberValueKey);
  FocusNode get carModelFocusNode => _getFormFocusNode(CarModelValueKey);
  FocusNode get carColorFocusNode => _getFormFocusNode(CarColorValueKey);
  FocusNode get vehicleNumberFocusNode =>
      _getFormFocusNode(VehicleNumberValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_VehicleInfoViewTextEditingControllers.containsKey(key)) {
      return _VehicleInfoViewTextEditingControllers[key]!;
    }
    _VehicleInfoViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _VehicleInfoViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_VehicleInfoViewFocusNodes.containsKey(key)) {
      return _VehicleInfoViewFocusNodes[key]!;
    }
    _VehicleInfoViewFocusNodes[key] = FocusNode();
    return _VehicleInfoViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    carModelController.addListener(() => _updateFormData(model));
    carColorController.addListener(() => _updateFormData(model));
    vehicleNumberController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    carModelController.addListener(() => _updateFormData(model));
    carColorController.addListener(() => _updateFormData(model));
    vehicleNumberController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          CarModelValueKey: carModelController.text,
          CarColorValueKey: carColorController.text,
          VehicleNumberValueKey: vehicleNumberController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        CarModelValueKey: _getValidationMessage(CarModelValueKey),
        CarColorValueKey: _getValidationMessage(CarColorValueKey),
        VehicleNumberValueKey: _getValidationMessage(VehicleNumberValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _VehicleInfoViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_VehicleInfoViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _VehicleInfoViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _VehicleInfoViewFocusNodes.values) {
      focusNode.dispose();
    }

    _VehicleInfoViewTextEditingControllers.clear();
    _VehicleInfoViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get carModelValue => this.formValueMap[CarModelValueKey] as String?;
  String? get carColorValue => this.formValueMap[CarColorValueKey] as String?;
  String? get vehicleNumberValue =>
      this.formValueMap[VehicleNumberValueKey] as String?;

  bool get hasCarModel =>
      this.formValueMap.containsKey(CarModelValueKey) &&
      (carModelValue?.isNotEmpty ?? false);
  bool get hasCarColor =>
      this.formValueMap.containsKey(CarColorValueKey) &&
      (carColorValue?.isNotEmpty ?? false);
  bool get hasVehicleNumber =>
      this.formValueMap.containsKey(VehicleNumberValueKey) &&
      (vehicleNumberValue?.isNotEmpty ?? false);

  bool get hasCarModelValidationMessage =>
      this.fieldsValidationMessages[CarModelValueKey]?.isNotEmpty ?? false;
  bool get hasCarColorValidationMessage =>
      this.fieldsValidationMessages[CarColorValueKey]?.isNotEmpty ?? false;
  bool get hasVehicleNumberValidationMessage =>
      this.fieldsValidationMessages[VehicleNumberValueKey]?.isNotEmpty ?? false;

  String? get carModelValidationMessage =>
      this.fieldsValidationMessages[CarModelValueKey];
  String? get carColorValidationMessage =>
      this.fieldsValidationMessages[CarColorValueKey];
  String? get vehicleNumberValidationMessage =>
      this.fieldsValidationMessages[VehicleNumberValueKey];
}

extension Methods on FormViewModel {
  setCarModelValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CarModelValueKey] = validationMessage;
  setCarColorValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CarColorValueKey] = validationMessage;
  setVehicleNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[VehicleNumberValueKey] = validationMessage;
}
