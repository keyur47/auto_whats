import 'package:auto_whats/utils/appString.dart';
import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const AppText(
      this.text, {
        this.color,
        this.fontSize,
        this.fontWeight,
        this.textAlign,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: AppString.fonts,
      ),
    );
  }
}
