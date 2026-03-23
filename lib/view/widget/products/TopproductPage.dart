import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Productdetails_controller.dart';
import 'package:testproject/core/constant/Applinkapi.dart';
import 'package:testproject/core/constant/colors.dart';

class Topproductpage extends GetView<Productdetails_ControllerIpm> {
  const Topproductpage({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put(Productdetails_ControllerIpm());
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Appcolor.babybluecolor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
        ),

        Positioned(
          top: 90,
          right: Get.width / 8,
          left: Get.width / 8,

          child: Hero(
            tag: controller.itemsModel.itemsId,
            child: CachedNetworkImage(
              imageUrl:
                  "${Applinkapi.getimageStatic}/${controller.itemsModel.itemsImagePath}",
              scale: 0.004,
              height: 260,
              //width: 100,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
