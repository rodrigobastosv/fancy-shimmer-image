/// A library for displaying images with a shimmering effect 
/// while they are being loaded from the network.
library fancy_shimmer_image;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/defaults.dart';
import 'package:fancy_shimmer_image/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';

///Widget that uses chached network image and Shimmer widgets to create
///beautiful widgets that are cached and have nice Shimmer effect
class FancyShimmerImage extends StatelessWidget {
  /// Constructs a `FancyShimmerImage` widget.
  ///
  /// The [imageUrl] is required and specifies the network image to be fetched.
  ///
  /// [boxFit] determines how the image should be inscribed into the box.
  /// [width] and [height] specify the dimensions of the widget.
  /// [shimmerDirection] sets the direction of the shimmer effect.
  /// [shimmerDuration] determines the duration of one shimmer cycle.
  /// [cacheKey] is an optional key for caching the image.
  /// [shimmerBaseColor], [shimmerHighlightColor],
  /// and [shimmerBackColor] define the colors for the shimmer effect.
  /// [errorWidget] specifies a widget to be shown in case of
  /// an image loading error.
  /// [boxDecoration] provides additional decorations for the widget's box.
  /// [color] sets a color for the image.
  /// [alignment] determines the alignment of the image within its box.
  /// [imageBuilder] is a builder function for custom image display.
  /// [cacheManager] manages caching of network images.
  /// [key] is the optional widget key.
  const FancyShimmerImage({
    required this.imageUrl,
    this.boxFit = BoxFit.fill,
    this.width = 300,
    this.height = 300,
    this.shimmerDirection = ShimmerDirection.ltr,
    this.shimmerDuration = const Duration(milliseconds: 1500),
    this.cacheKey,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.shimmerBackColor,
    this.errorWidget,
    this.boxDecoration,
    this.color,
    this.alignment,
    this.imageBuilder,
    this.cacheManager,
    Key? key,
  }) : super(key: key);

  /// The network URL for the image.
  final String imageUrl;

  /// Width of the widget.
  final double width;

  /// Height of the widget.
  final double height;

  /// Direction of the shimmer effect.
  final ShimmerDirection shimmerDirection;

  /// Duration of one shimmer effect cycle.
  final Duration shimmerDuration;

  /// How the image should fit in its box.
  final BoxFit boxFit;

  /// Optional cache key for the image.
  final String? cacheKey;

  /// Base color for the shimmer effect.
  final Color? shimmerBaseColor;

  /// Highlight color for the shimmer effect.
  final Color? shimmerHighlightColor;

  /// Background color for the shimmer effect.
  final Color? shimmerBackColor;

  /// Widget to display in case of image loading error.
  final Widget? errorWidget;

  /// Decorations for the widget's box.
  final BoxDecoration? boxDecoration;

  /// Color to paint the image.
  final Color? color;

  /// Alignment of the image within its box.
  final Alignment? alignment;

  /// Builder function for custom image display.
  final ImageWidgetBuilder? imageBuilder;

  /// Cache manager for network images.
  final BaseCacheManager? cacheManager;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      alignment: alignment ?? Alignment.center,
      color: color,
      imageUrl: imageUrl,
      cacheKey: cacheKey,
      fit: boxFit,
      width: width,
      height: height,
      imageBuilder: imageBuilder,
      cacheManager: cacheManager,
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
