import 'package:flutter/material.dart';
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
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text ?? ''),
      ),
    );
  }
}
