import 'package:flutter/material.dart';
import 'package:testproject/core/constant/colors.dart';

class Paymentmethod extends StatelessWidget {
  final String title;
  final bool IsActive;

  const Paymentmethod({super.key, required this.title, required this.IsActive});

  @override
  Widget build(BuildContext context) {
    return     Container(
      height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color:IsActive?Appcolor.primarycolor: Appcolor.babybluecolor,
                borderRadius: BorderRadius.circular(15),
              ),
              child:  Text(
                title,
                style: TextStyle(
                  color: Appcolor.backgraund,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
;
  }
}