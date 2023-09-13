import 'package:flutter/material.dart';

/// `DefaultErrorWidget` is a widget designed to display a default error message
/// when an image cannot be loaded. It shows a white container with a centered
/// error icon and an accompanying error message.
class DefaultErrorWidget extends StatelessWidget {
  /// Constructs a `DefaultErrorWidget`.
  ///
  /// The dimensions of the widget are specified by [width] and [height].
  /// [key] is the optional widget key.
  const DefaultErrorWidget({
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  /// Width of the widget.
  final double width;

  /// Height of the widget.
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.error, color: Colors.red),
          Text('Error loading Image')
        ],
      ),
    );
  }
}
