import 'package:flutter/material.dart';

Widget textWidget({
  required String text,
  Color? color,
  double? size,
  bool boldText = false,
  TextAlign? textAlign,
}) {
  return Text(
    '$text',
    textAlign: textAlign,
    style: TextStyle(
        fontSize: size,
        fontWeight: boldText ? FontWeight.bold : FontWeight.normal,
        color: color),
  );
}

Widget defaultBotton({
  required String text,
  required Function() function,
  Color? colors,
  Color? textcolor,
  double? size,
  EdgeInsetsGeometry? margin,
  bool boldText = false,
  double? width,
}) {
  return Container(
    margin: margin,
    width: width == null ? double.infinity : width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: colors,
    ),
    child: MaterialButton(
      onPressed: function,
      child: textWidget(
        text: text,
        color: textcolor,
        size: size,
        boldText: boldText,
      ),
    ),
  );
}
