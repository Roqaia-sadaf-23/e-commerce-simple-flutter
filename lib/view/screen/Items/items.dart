import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Items_controller.dart';
import 'package:testproject/core/class/handlingdataview.dart';
import 'package:testproject/view/screen/Home/homepage.dart';

import 'package:testproject/view/widget/CustomAppbar.dart';
import 'package:testproject/view/widget/items/CustolistCategoryItem.dart';
import 'package:testproject/view/widget/items/ListItems.dart';

import '../../../controller/Favorite_controller.dart';

class Items extends StatelessWidget {
  const Items({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(Items_controllerImp());
 Get.put(FavoriteControllerim());

    return Scaffold(
      body: GetBuilder<Items_controllerImp>(
        builder:
            (controller) => Container(
              padding: EdgeInsets.all(15),
              child: ListView(
                children: [
                  CustomAppbar(
                    titalappbar: "Find Product",
                    onPressedsreach: () {
                      controller.oncearchItem();
                    },
                    onPressedIconfavorite: () {
                      controller.GotoFavoritePage();
                    },
                    mycotroller: controller.search,
                    onChanged: (val) {
                      controller.checksearch(val);
                    },
                  ),

                  Handlingdataview(
                    statusRecuest: controller.statusRecuest,
                    widget: Container(
                      child:
                          controller.isSearch
                              ? ListitemSearch(ItemsW: controller.listdata)
                              : Column(
                                children: [
                                  CustolistCategoryItem(),

                                  Listitems(),
                                ],
                              ),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
