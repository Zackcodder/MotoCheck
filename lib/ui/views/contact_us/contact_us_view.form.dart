// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_strings.dart';

const String SubjectValueKey = ksContactUsSubjectHint;
const String MessageValueKey = ksContactUsSubjectHint;

final Map<String, TextEditingController> _ContactUsViewTextEditingControllers =
    {};

final Map<String, FocusNode> _ContactUsViewFocusNodes = {};

final Map<String, String? Function(String?)?> _ContactUsViewTextValidations = {
  SubjectValueKey: null,
  MessageValueKey: null,
};

mixin $ContactUsView on StatelessWidget {
  TextEditingController get subjectController =>
      _getFormTextEditingController(SubjectValueKey);
  TextEditingController get messageController =>
      _getFormTextEditingController(MessageValueKey);
  FocusNode get subjectFocusNode => _getFormFocusNode(SubjectValueKey);
  FocusNode get messageFocusNode => _getFormFocusNode(MessageValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_ContactUsViewTextEditingControllers.containsKey(key)) {
      return _ContactUsViewTextEditingControllers[key]!;
    }
    _ContactUsViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ContactUsViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ContactUsViewFocusNodes.containsKey(key)) {
      return _ContactUsViewFocusNodes[key]!;
    }
    _ContactUsViewFocusNodes[key] = FocusNode();
    return _ContactUsViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    subjectController.addListener(() => _updateFormData(model));
    messageController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    subjectController.addListener(() => _updateFormData(model));
    messageController.addListener(() => _updateFormData(model));
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
          SubjectValueKey: subjectController.text,
          MessageValueKey: messageController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        SubjectValueKey: _getValidationMessage(SubjectValueKey),
        MessageValueKey: _getValidationMessage(MessageValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _ContactUsViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_ContactUsViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _ContactUsViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ContactUsViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ContactUsViewTextEditingControllers.clear();
    _ContactUsViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get subjectValue => this.formValueMap[SubjectValueKey] as String?;
  String? get messageValue => this.formValueMap[MessageValueKey] as String?;

  bool get hasSubject =>
      this.formValueMap.containsKey(SubjectValueKey) &&
      (subjectValue?.isNotEmpty ?? false);
  bool get hasMessage =>
      this.formValueMap.containsKey(MessageValueKey) &&
      (messageValue?.isNotEmpty ?? false);

  bool get hasSubjectValidationMessage =>
      this.fieldsValidationMessages[SubjectValueKey]?.isNotEmpty ?? false;
  bool get hasMessageValidationMessage =>
      this.fieldsValidationMessages[MessageValueKey]?.isNotEmpty ?? false;

  String? get subjectValidationMessage =>
      this.fieldsValidationMessages[SubjectValueKey];
  String? get messageValidationMessage =>
      this.fieldsValidationMessages[MessageValueKey];
}

extension Methods on FormViewModel {
  setSubjectValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SubjectValueKey] = validationMessage;
  setMessageValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MessageValueKey] = validationMessage;
}
