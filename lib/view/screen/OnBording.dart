import 'package:flutter/material.dart';
import 'package:testproject/controller/onboarding_controller.dart';
import 'package:testproject/view/widget/onboarding/cusomslider.dart';
import 'package:testproject/view/widget/onboarding/custombutton.dart';
import 'package:testproject/view/widget/onboarding/customdotcontroller.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onboardingControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: const Text('On Boarding'),
        // backgroundColor: const Color.fromARGB(255, 131, 131, 247),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 3, child: CusomSlideronboarding()),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  Customdotcontrolleronboarding(),
                  Spacer(flex: 1),
                  Custombuttononboarding(),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
