import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// `ImageShimmerWidget` is a widget that displays a shimmer effect,
/// typically used as a placeholder for images while they are being loaded.
/// It uses the `Shimmer` widget to create the shimmer effect.
class ImageShimmerWidget extends StatelessWidget {
  /// Constructs an `ImageShimmerWidget`.
  ///
  /// [shimmerDirection], [shimmerDuration], [baseColor], [highlightColor],
  /// and [backColor] are required to define the shimmer 
  /// effect's appearance and behavior.
  ///
  /// [width] and [height] specify the dimensions of the widget.
  /// [boxDecoration] provides additional decorations for the widget's box.
  /// [key] is the optional widget key.
  const ImageShimmerWidget({
    required this.shimmerDirection,
    required this.shimmerDuration,
    required this.baseColor,
    required this.highlightColor,
    required this.backColor,
    this.width,
    this.height,
    this.boxDecoration,
    Key? key,
  }) : super(key: key);

  /// Width of the widget.
  final double? width;

  /// Height of the widget.
  final double? height;

  /// Direction of the shimmer effect.
  final ShimmerDirection shimmerDirection;

  /// Duration of one shimmer effect cycle.
  final Duration shimmerDuration;

  /// Base color for the shimmer effect.
  final Color baseColor;

  /// Highlight color for the shimmer effect.
  final Color highlightColor;

  /// Background color for the shimmer effect.
  final Color backColor;

  /// Decorations for the widget's box.
  final BoxDecoration? boxDecoration;

  @override
  Widget build(BuildContext context) {
    if (boxDecoration != null) {
      return Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        direction: shimmerDirection,
        period: shimmerDuration,
        child: Container(
          width: width,
          height: height,
          decoration: boxDecoration,
        ),
      );
    }
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        direction: shimmerDirection,
        period: shimmerDuration,
        child: Container(
          width: width,
          height: height,
          color: backColor,
        ),
      ),
    );
  }
}
