import 'package:flutter/material.dart';
import 'package:medical/view/Utils/theme.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 5,

          fixedSize: Size.fromHeight(40),
          // minimumSize: Size(50, 100),
          // padding: const EdgeInsets.all(25.0),
          backgroundColor: Color.fromARGB(255, 3, 190, 150),
          foregroundColor: g1, // color text
          shadowColor: Colors.black,
          side: BorderSide(width: 0.1, color: g6),
          //--------------------------------------------------
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
              // color: B,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
