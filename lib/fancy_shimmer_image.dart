library fancy_shimmer_image;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'defaults.dart';
import 'widgets/widgets.dart';

class FancyShimmerImage extends StatelessWidget {
  FancyShimmerImage({
    @required this.imageUrl,
    this.boxFit = BoxFit.fill,
    this.width = 300,
    this.height = 300,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.shimmerBackColor,
  });

  final String imageUrl;
  final double width;
  final double height;
  final BoxFit boxFit;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
  final Color shimmerBackColor;

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
        baseColor: shimmerBaseColor ?? defaultShimmerBaseColor,
        highlightColor: shimmerHighlightColor ?? defaultShimmerHighlightColor,
        backColor: shimmerBackColor ?? defaultShimmerBackColor,
      ),
      errorWidget: (context, url, error) => DefaultErrorWidget(
        width: width,
        height: height,
      ),
    );
  }
}
