import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/onboarding_controller.dart';
// Ensure that OnboardingControllerImp is defined and exported from onboarding_controller.dart
import 'package:testproject/core/constant/colors.dart';

class Custombuttononboarding extends GetView<onboardingControllerImp> {
  const Custombuttononboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 50,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        onPressed: () {
          controller.next();
        },
        color: Appcolor.primarycolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Text(
          'Contenu',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
