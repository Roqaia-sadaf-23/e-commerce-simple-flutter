import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:testproject/controller/onboarding_controller.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:testproject/data/datasource/Static/static.dart';

class Customdotcontrolleronboarding extends StatelessWidget {
  const Customdotcontrolleronboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onboardingControllerImp>(
      
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onboardinglist.length,
            (index) => Container(
              margin: const EdgeInsets.only(right: 5),
              height: 10,
              width: controller.currentpage == index ? 20 : 5,
              decoration: BoxDecoration(
                color:
                    controller.currentpage == index
                        ? Appcolor.primarycolor
                        : Appcolor.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}
