import 'package:flutter/material.dart';

class CircularIconOverlay extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;
  const CircularIconOverlay({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(child: child),
    );
  }
}
