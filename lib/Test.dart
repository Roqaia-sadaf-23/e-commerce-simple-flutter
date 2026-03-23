import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/test_controller.dart';
import 'package:testproject/core/class/handlingdataview.dart';
import 'package:testproject/core/constant/colors.dart';

class testview extends StatelessWidget {
  const testview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(title: const Text('Test View')),
      backgroundColor: Appcolor.backgraund,
      body: GetBuilder<TestController>(
        builder: (controller) {
          return Handlingdataview(
            statusRecuest: controller.statusRecuest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.data[index]['name'] ?? 'No Name'),
                  subtitle: Text(controller.data[index]['email'] ?? 'No email'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
