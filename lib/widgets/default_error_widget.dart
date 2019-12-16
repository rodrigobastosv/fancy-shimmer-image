import 'package:flutter/material.dart';

class DefaultErrorWidget extends StatelessWidget {
  DefaultErrorWidget({
    this.width,
    this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Color.fromRGBO(217, 217, 217, 0.5),
      child: Icon(Icons.error, color: Colors.red),
    );
  }
}
