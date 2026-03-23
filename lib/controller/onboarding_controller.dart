import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/core/constant/routes.dart';
import 'package:testproject/core/services/serveses.dart';
import 'package:testproject/data/datasource/Static/static.dart';

abstract class OnboardingController extends GetxController {
  next();
  onpagechange(int index);
}

// ignore: camel_case_types
class onboardingControllerImp extends OnboardingController {
  int currentpage = 0;
  late PageController pagecontroller;
  Myservices myservices = Get.find();
  @override
  next() {
    currentpage++;
    if (currentpage > onboardinglist.length - 1) {
      myservices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(Approutes.login);
    } else {
      pagecontroller.animateToPage(
        currentpage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  onpagechange(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}
