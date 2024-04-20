import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

ToastFuture toast(BuildContext context, {String? text}) {
  //
  // String? text;
  return showToast(
    text,
    textStyle: TextStyle(
        fontSize: 20,
        color: Colors.white,
        // fontFamily: "f1",
        fontWeight: FontWeight.w400),
    context: context,
    backgroundColor: Color(0xFF343A40),
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fade,
    position: StyledToastPosition.top,
    animDuration: Duration(seconds: 1),
    duration: Duration(seconds: 3),
    curve: Curves.elasticOut,
    reverseCurve: Curves.linear,
  );
}
