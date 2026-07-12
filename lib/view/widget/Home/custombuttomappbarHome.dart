import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/HomeScreen_controller.dart';
import 'package:testproject/view/widget/Home/customButtonAppbar.dart';

class Custombuttomappbarhome extends GetView<HomeScreen_controllerImp> {
  const Custombuttomappbarhome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreen_controllerImp>(
      builder: (controller) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 15,
          child: Row(
            children: [
              ...List.generate(controller.buttonappbar.length + 1, (index) {
                if (index == controller.buttonappbar.length ~/ 2) {
                  // مكان الـ FloatingActionButton في النص
                  return const Spacer();
                }
                // اضبط الـ i بحيث يتجاوز الـ Spacer
                int i = index > controller.buttonappbar.length ~/ 2
                    ? index - 1
                    : index;

                return Custombuttonappbar(
                  onPressed: () {
                    controller.changepage(i);
                  },
                  text: controller.buttonappbar[i]["title"],
                  iconData: controller.buttonappbar[i]["icon"],
                  active: controller.currenttpage == i,
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
