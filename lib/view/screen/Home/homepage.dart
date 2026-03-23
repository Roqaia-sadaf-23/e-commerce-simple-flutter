import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Favorite_controller.dart';
import 'package:testproject/controller/Home_controller.dart';
import 'package:testproject/core/class/handlingdataview.dart';
import 'package:testproject/core/constant/Applinkapi.dart';
import 'package:testproject/data/model/itemsWithCatogery.dart' show ItemsWModel;

import 'package:testproject/view/widget/Home/CustoListItems.dart';
import 'package:testproject/view/widget/CustomAppbar.dart';
import 'package:testproject/view/widget/Home/CustomCardHome.dart';
import 'package:testproject/view/widget/Home/CustomListCategoles.dart';
import 'package:testproject/view/widget/Home/CustomTitleHome.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
Get.put(FavoriteControllerim());

    return GetBuilder<HomeControllerImp>(
      builder:
          (controller) => Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(top: 19),
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

                //****** */
                Handlingdataview(
                  statusRecuest: controller.statusRecuest,
                  widget:
                      controller.isSearch
                          ? ListitemSearch(ItemsW: controller.listdata)
                          : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomCardHome(
                                tital: "A summer suprise",
                                Body: "Caskback 20%",
                              ),
                              Customtitlehome(title: "Categoreles : "),

                              Customlistcategoles(),

                              Customtitlehome(title: "Product for you "),
                              CustolistitemsHome(),
                            ],
                          ),
                ),
              ],
            ),
          ),
    );
  }
}

class ListitemSearch extends GetView<HomeControllerImp> {
  final List<ItemsWModel> ItemsW;

  const ListitemSearch({super.key, required this.ItemsW});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ItemsW.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, Index) {
        return InkWell(
          onTap: () {
            controller.GotopageProductdetails(ItemsW[Index]);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${Applinkapi.getimageStatic}/${ItemsW[Index].itemsImagePath}",
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(ItemsW[Index].itemsName.toString()),
                        subtitle: Text(ItemsW[Index].categorlesName.toString()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
