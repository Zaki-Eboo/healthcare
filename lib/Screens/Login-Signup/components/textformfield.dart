import 'package:flutter/material.dart';
import 'package:medical/view/Utils/theme.dart';

class CustomTextForm extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;
  String? Function(String?)? myValidator;
  CustomTextForm({
    super.key,
    required this.hinttext,
    required this.mycontroller,
    required this.myValidator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      validator: myValidator,
      cursorColor: g6,
      // style: TextStyle(height: 4),
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(fontSize: 14, color: g5),
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        filled: true,
        fillColor: g2,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: g2)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: g2),
        ),
      ),
    );
  }
}

/* class CustomTextForm extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;

  const CustomTextForm(
      {super.key, required this.hinttext, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      cursorColor: g6,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(fontSize: 14, color: g5),
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        filled: true,
        fillColor: g2,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: g2)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: g2),
        ),
      ),
    );
  }
}
 */