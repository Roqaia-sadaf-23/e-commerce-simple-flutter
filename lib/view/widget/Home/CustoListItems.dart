import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Home_controller.dart';
import 'package:testproject/core/constant/Applinkapi.dart';
import 'package:testproject/core/constant/colors.dart';

class CustolistitemsHome extends GetView<HomeControllerImp> {
  const CustolistitemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,

      child: ListView.builder(
        itemCount: controller.Itemsdata.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          var item = controller.Itemsdata[i];
          // ignore: non_constant_identifier_names
          var ItemimagePath = item['items_ImagePath'];

          return Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: CachedNetworkImage(
                  imageUrl: "${Applinkapi.getimageStatic}/$ItemimagePath",
                  height: 100,
                  width: 150,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Appcolor.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(19),
                ),
                height: 130,
                width: 180,
              ),
              SizedBox(height: 15),
              Positioned(
                child: Text(
                  "     ${item['items_Name']}",
                  style: TextStyle(
                    color: Appcolor.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
