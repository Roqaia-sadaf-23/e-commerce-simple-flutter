import 'package:flutter/material.dart';
import 'package:testproject/core/constant/colors.dart';

class CustomCardHome extends StatelessWidget {
  final String tital;
  final String Body;
  const CustomCardHome({super.key, required this.tital, required this.Body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),

      child: Stack(
        children: [
          Container(
            // alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Appcolor.primarycolor,
              borderRadius: BorderRadius.circular(14),
            ),
            height: 150,
            //  "A summer suprise"
            // "Caskback 20%"
            child: ListTile(
              title: Text(
                tital,
                style: TextStyle(color: Appcolor.black, fontSize: 20),
              ),

              subtitle: Text(
                Body,
                style: TextStyle(color: Appcolor.black, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
