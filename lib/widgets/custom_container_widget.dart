import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key,
      required this.customColor,
      this.child,
      required this.borderWidth,
      required this.duration})
      : super(key: key);
  final Color customColor;
  final child;
  final double borderWidth;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: borderWidth),
        color: customColor,
      ),
      constraints: const BoxConstraints.expand(),
      duration: Duration(seconds: duration),
      child: child,
    );
  }
}
