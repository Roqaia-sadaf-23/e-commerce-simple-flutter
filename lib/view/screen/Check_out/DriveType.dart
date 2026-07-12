import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class DriveType extends StatelessWidget {
  final String imageName;
  final String title;
  final bool isActive;
  const DriveType({super.key, required this.imageName, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color:isActive? Appcolor.primarycolor:Appcolor.backgraund),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                       imageName,
                        width: 80,
                      ),

                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
  }
}