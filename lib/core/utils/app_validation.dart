import 'package:base_project/core/utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class AppValidation {
  const AppValidation._();
  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final RegExp _phoneRegex = RegExp(r'^07[0-9]{9}$');

  static String? validateEmail(BuildContext ctx, String value) {
    final isRequire = fieldRequired(ctx, value);
    if (isRequire != null) {
      return isRequire;
    }
    if (!_emailRegex.hasMatch(value)) {
      return ctx.tr.inValidEmail;
    }
    return null;
  }

  static String? validatePassword(BuildContext ctx, String value) {
    final isRequire = fieldRequired(ctx, value);
    if (isRequire != null) {
      return isRequire;
    }
    if (value.length < 6) {
      return ctx.tr.passwordMustBeAtLeast6Characters;
    }
    return null;
  }

  static String? validateName(BuildContext ctx, String value) {
    final isRequire = fieldRequired(ctx, value);
    if (isRequire != null) {
      return isRequire;
    }
    if (value.length < 3) {
      return ctx.tr.nameMustBeAtLeast3Characters;
    }
    return null;
  }

  static String? validatePhoneNumber(BuildContext ctx, String value) {
    final isRequire = fieldRequired(ctx, value);
    if (isRequire != null) {
      return isRequire;
    }
    if (!_phoneRegex.hasMatch(value)) {
      return ctx.tr.inValidPhoneNumber;
    }
    return null;
  }

  static String? fieldRequired(BuildContext ctx, String value) {
    if (value.isEmpty) {
      return ctx.tr.fieldRequired;
    }
    return null;
  }
}
