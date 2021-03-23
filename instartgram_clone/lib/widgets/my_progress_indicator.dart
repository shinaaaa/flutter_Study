import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  final double containerSize;
  final double progressSize;

  const MyProgressIndicator(
      // progressSize 기본 사이즈 60
      {Key key,
      this.containerSize,
      this.progressSize = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: containerSize,
        height: containerSize,
        child: SizedBox(
            width: progressSize,
            height: progressSize,
            child: Image.asset('assets/images/loading_img.gif')));
  }
}
