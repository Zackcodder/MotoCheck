// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';
import 'package:transiter_driver/ui/common/ui_helpers.dart';

import '../../views/login/login_viewmodel.dart';

class PrimaryButton extends StatefulWidget {
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
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel;
    return SizedBox(
      width: widget.width ?? screenWidth(context),
      height: widget.height,
      child: MaterialButton(
        onPressed: widget.onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        color: kcLoginButtonColor,
        child: 
             Text(
                widget.text ?? 'Loading......',
                style: TextStyle(color: kcWhite),
              ),
      ),
    );
  }
}
