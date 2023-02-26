import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final Widget Function(BuildContext, String)? placeholder;
  final double? height;
  final double? width;
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.placeholder,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: placeholder ??
          (context, url) => const CircularProgressIndicator(
                backgroundColor: kcDarkLight,
              ),
      height: height,
      width: width,
    );
  }
}
