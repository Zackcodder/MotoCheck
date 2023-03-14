import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';

class TransiterTextField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  const TransiterTextField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: kcWhite,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
