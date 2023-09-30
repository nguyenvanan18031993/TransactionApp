import 'package:flutter/material.dart';

class AppFlatButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? borderWidth;
  final String text;
  final double? radius;
  final double? height;
  final Color? focusColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? borderColor;
  final Color? textColor;

  const AppFlatButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.focusColor,
      this.splashColor,
      this.highlightColor,
      this.borderColor,
      this.textColor,
      this.radius,
      this.borderWidth,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.only(left: 14.0, top: 4.0, bottom: 4.0)),
          backgroundColor: onPressed == null
              ? MaterialStateProperty.all<Color>(Colors.grey)
              : MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8.0), side: const BorderSide(color: Colors.red)))),
      onPressed: onPressed,
      child: SizedBox(
          height: 44.0,
          width: double.infinity,
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ))),
    );
  }
}
