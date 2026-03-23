import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/HomeScreen_controller.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:testproject/core/constant/routes.dart';
import 'package:testproject/view/widget/Home/custombuttomappbarHome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreen_controllerImp());
    return GetBuilder<HomeScreen_controllerImp>(
      builder:
          (controller) => Scaffold(
            //   backgroundColor: Colors.deepOrange,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.toNamed(Approutes.Cart);
              },
              backgroundColor: Appcolor.babybluecolor,
              child: Icon(Icons.shopping_basket_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Custombuttomappbarhome(),

            body: controller.Listpage.elementAt(controller.currenttpage),
          ),
    );
  }
}
