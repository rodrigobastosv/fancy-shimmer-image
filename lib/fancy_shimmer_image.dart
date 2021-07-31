library fancy_shimmer_image;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'defaults.dart';
import 'widgets/widgets.dart';

///Widget that uses chached network image and Shimmer widgets to create
///beautiful widgets that are cached and have nice Shimmer effect
class FancyShimmerImage extends StatelessWidget {
  FancyShimmerImage({
    Key? key,
    required this.imageUrl,
    this.width = 300,
    this.height = 300,
    this.shimmerDirection = ShimmerDirection.ltr,
    this.shimmerDuration = const Duration(milliseconds: 1500),
    this.fit = BoxFit.fill,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.shimmerBackColor,
    this.errorWidget,
    this.boxDecoration,
    this.color,
    this.alignment,
  }) : super(key: key);

  final String imageUrl;
  final double width;
  final double height;
  final ShimmerDirection shimmerDirection;
  final Duration shimmerDuration;
  final BoxFit fit;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final Color? shimmerBackColor;
  final Widget? errorWidget;
  final BoxDecoration? boxDecoration;
  final Color? color;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      alignment: alignment ?? Alignment.center,
      color: color,
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      placeholder: (context, url) => ImageShimmerWidget(
        width: width,
        height: height,
        shimmerDirection: shimmerDirection,
        shimmerDuration: shimmerDuration,
        baseColor: shimmerBaseColor ?? defaultShimmerBaseColor,
        highlightColor: shimmerHighlightColor ?? defaultShimmerHighlightColor,
        backColor: shimmerBackColor ?? defaultShimmerBackColor,
        boxDecoration: boxDecoration,
      ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          DefaultErrorWidget(
            width: width,
            height: height,
          ),
    );
  }
}
