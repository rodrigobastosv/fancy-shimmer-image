import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageShimmerWidget extends StatelessWidget {
  ImageShimmerWidget({
    this.width,
    this.height,
    @required this.baseColor,
    @required this.highlightColor,
    @required this.backColor,
  })  : assert(baseColor != null),
        assert(highlightColor != null),
        assert(backColor != null);

  final double width;
  final double height;
  final Color baseColor;
  final Color highlightColor;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          width: width,
          height: height,
          color: backColor,
        ),
      ),
    );
  }
}
