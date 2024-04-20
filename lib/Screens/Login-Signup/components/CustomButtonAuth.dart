// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

//
class CustomButtonAuth extends StatelessWidget {
  CustomButtonAuth({
    required this.text,
    required this.imageUrl,
    required this.color_,
    this.onPressed,
  });
  String text;
  String imageUrl;
  Color color_;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        fixedSize: Size.fromHeight(40),
        // minimumSize: Size(50, 100),
        // padding: const EdgeInsets.all(25.0),
        backgroundColor: color_,
        foregroundColor: Colors.white, // color text
        shadowColor: Colors.black,
        side: BorderSide(width: 0.9, color: color_),
        //--------------------------------------------------
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          Image.asset(
            imageUrl,
            width: 20,
          )
        ],
      ),
    );
  }
}
