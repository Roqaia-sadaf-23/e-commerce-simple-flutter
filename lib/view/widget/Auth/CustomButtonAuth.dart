import 'package:flutter/material.dart';
import 'package:testproject/core/constant/colors.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 13),

        onPressed: onPressed,
        color: Appcolor.primarycolor,
        textColor: Appcolor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(text),
      ),
    );
  }
}
