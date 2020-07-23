import 'package:flutter/material.dart';

///Widget default to show erros when cannot load image
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
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.error, color: Colors.red),
          Text('Error loading Image')
        ],
      ),
    );
  }
}
