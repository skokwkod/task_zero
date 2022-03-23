import 'package:flutter/material.dart';

class CustomPhotoWidget extends StatelessWidget {
  const CustomPhotoWidget({Key? key, required this.image, required this.fit})
      : super(key: key);
  final String image;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(image: AssetImage(image), fit: fit),
        border: Border.all(),
      ),
    );
  }
}
