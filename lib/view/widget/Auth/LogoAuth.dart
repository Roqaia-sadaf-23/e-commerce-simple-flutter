import 'package:flutter/material.dart';
import 'package:testproject/core/constant/imagesassent.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Appimagesassent.logo,
      height: 100,
      // fit: BoxFit.fill
    );
  }
}
