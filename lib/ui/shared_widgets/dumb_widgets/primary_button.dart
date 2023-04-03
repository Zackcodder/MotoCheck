// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';

class PrimaryButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final VoidCallback? onPressed;
  const PrimaryButton({
    super.key,
    this.width,
    this.height,
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? screenWidth(context),
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        color: kcLoginButtonColor,
        child: Text(text ?? '',
          style: TextStyle(color: kcWhite),
        ),
      ),
    );
  }
}
