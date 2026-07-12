// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:testproject/controller/Items_controller.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:get/get.dart';

class CustolistCategoryItem extends StatelessWidget {
  const CustolistCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Items_controllerImp>(
      builder: (controller) {
        return SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.Categoreles.length,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              var item = controller.Categoreles[index];
              // ignore: non_constant_identifier_names
              var Iditem = item["categorles_ID"];
              var caName = item['categorles_name'];

              return GestureDetector(
                onTap: () {
                  controller.changeCategory (index,Iditem);
                },
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration:
                          controller.Selectedcat == index
                              ? const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 3,
                                    color: Appcolor.babybluecolor,
                                  ),
                                ),
                              )
                              : null,
                      child: Text(caName, style: const TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
