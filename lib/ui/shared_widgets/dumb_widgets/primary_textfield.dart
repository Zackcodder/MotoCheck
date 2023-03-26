// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';

class TransiterTextField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final Widget? childWidget;
  final Widget? childWidget2;
  final TextEditingController? controller;
  const TransiterTextField({
    super.key,
    this.hintText,
    this.childWidget,
    this.childWidget2,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      width: 263,
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: childWidget,
          suffixIcon: childWidget2,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
          Radius.circular(6.0),
          ),
          borderSide: BorderSide(
          style: BorderStyle.solid,
          color: kcTextFieldBorder,
          width: 2.0,
          ),
          ),
        ),
      ),
    );
  }
}