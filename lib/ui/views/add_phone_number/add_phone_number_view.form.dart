// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transiter_driver/ui/views/add_phone_number/add_phone_number_viewmodel.dart';

const String PhoneNumberValueKey = 'phoneNumber';

final Map<String, TextEditingController>
    _AddPhoneNumberViewTextEditingControllers = {};

final Map<String, FocusNode> _AddPhoneNumberViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _AddPhoneNumberViewTextValidations = {
  PhoneNumberValueKey: AddPhoneNumberValidators.validatePhoneNumber,
};

mixin $AddPhoneNumberView on StatelessWidget {
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);
  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_AddPhoneNumberViewTextEditingControllers.containsKey(key)) {
      return _AddPhoneNumberViewTextEditingControllers[key]!;
    }
    _AddPhoneNumberViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddPhoneNumberViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddPhoneNumberViewFocusNodes.containsKey(key)) {
      return _AddPhoneNumberViewFocusNodes[key]!;
    }
    _AddPhoneNumberViewFocusNodes[key] = FocusNode();
    return _AddPhoneNumberViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    phoneNumberController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    phoneNumberController.addListener(() => _updateFormData(model));
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
          PhoneNumberValueKey: phoneNumberController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        PhoneNumberValueKey: _getValidationMessage(PhoneNumberValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _AddPhoneNumberViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_AddPhoneNumberViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AddPhoneNumberViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddPhoneNumberViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddPhoneNumberViewTextEditingControllers.clear();
    _AddPhoneNumberViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;

  bool get hasPhoneNumber =>
      this.formValueMap.containsKey(PhoneNumberValueKey) &&
      (phoneNumberValue?.isNotEmpty ?? false);

  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;

  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
}

extension Methods on FormViewModel {
  setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;
}
