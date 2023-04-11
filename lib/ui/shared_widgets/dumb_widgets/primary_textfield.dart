
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      width: 300,
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: childWidget,
          suffixIcon: childWidget2,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          border: const OutlineInputBorder(
            borderRadius: const BorderRadius.all(
               const Radius.circular(6.0),
            ),
            // borderSide: BorderSide(
            // style: BorderStyle.none,
            // color: kcTextFieldBorder,
            // width: 0.5,
            // ),
          ),
        ),
      ),
    );
  }
}
