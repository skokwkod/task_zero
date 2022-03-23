import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.customText, required this.customTitle}) : super(key: key);
  final String customTitle;
  final String customText;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
          text:
          customTitle,
          children: [
            TextSpan(
                text:
                customText,
                style: const TextStyle(
                    fontWeight:
                    FontWeight
                        .normal,
                    fontStyle: FontStyle
                        .italic,
                    fontSize: 14))
          ]),
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20),
      minFontSize: 5,
      overflow: TextOverflow.fade,
      textAlign: TextAlign.center,
    );
  }
}
