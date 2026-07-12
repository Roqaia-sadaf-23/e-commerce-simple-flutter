import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:testproject/controller/Home_controller.dart';
import 'package:testproject/core/constant/Applinkapi.dart';
import 'package:testproject/core/constant/colors.dart';

class Customlistcategoles extends GetView<HomeControllerImp> {
  const Customlistcategoles({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.Categorydata.length,
        itemBuilder: (context, index) {
          // ignore: unused_label

          var item = controller.Categorydata[index];
          var iditem = item["categorles_ID"];
          var imagePath = item['categorles_ImagePath'];

          return InkWell(
            onTap: () {
              controller.Gotoitmes(controller.Categorydata,index, iditem);
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Appcolor.babybluecolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: "${Applinkapi.getimageStatic}/$imagePath",

                    height: 60,
                    width: 60,
                    /* errorBuilder: 
                                        (context, error, stackTrace) =>
                                            Icon(Icons.image_not_supported), */
                  ),
                ),
                SizedBox(height: 5),
                Text(item['categorles_name'], style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
