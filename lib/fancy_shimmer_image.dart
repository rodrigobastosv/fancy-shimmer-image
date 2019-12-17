library fancy_shimmer_image;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'defaults.dart';
import 'widgets/widgets.dart';

class FancyShimmerImage extends StatelessWidget {
  FancyShimmerImage({
    @required this.imageUrl,
    this.boxFit = BoxFit.fill,
    this.width = 300,
    this.height = 300,
    this.shimmerDirection = ShimmerDirection.ltr,
    this.shimmerDuration = const Duration(milliseconds: 1500),
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.shimmerBackColor,
    this.errorWidget,
  });

  final String imageUrl;
  final double width;
  final double height;
  final ShimmerDirection shimmerDirection;
  final Duration shimmerDuration;
  final BoxFit boxFit;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
  final Color shimmerBackColor;
  final Widget errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: boxFit,
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
      ),
      errorWidget: (context, url, error) => errorWidget ?? DefaultErrorWidget(
        width: width,
        height: height,
      ),
    );
  }
}
