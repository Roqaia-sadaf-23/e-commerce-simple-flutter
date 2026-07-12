import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:testproject/controller/onboarding_controller.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:testproject/data/datasource/Static/static.dart';

class CusomSlideronboarding extends GetView<onboardingControllerImp> {
  const CusomSlideronboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pagecontroller,
      onPageChanged: (value) {
        controller.onpagechange(value);
      },
      itemCount: onboardinglist.length,
      itemBuilder:
          (context, i) => Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    onboardinglist[i].title.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 80),
                  Image.asset(
                    onboardinglist[i].image!,
                    width: Get.width / 1.9,
                    //height: 200,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 80),
                  Text(
                    onboardinglist[i].body.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Appcolor.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
