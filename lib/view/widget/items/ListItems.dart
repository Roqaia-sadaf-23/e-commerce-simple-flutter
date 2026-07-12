import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Favorite_controller.dart';
import 'package:testproject/controller/Items_controller.dart';
import 'package:testproject/core/class/handlingdataview.dart';
import 'package:testproject/core/constant/Applinkapi.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:testproject/core/constant/imagesassent.dart';

class Listitems extends StatelessWidget {
  const Listitems({super.key});

  @override
  Widget build(BuildContext context) {
  /* Get.put(Items_controllerImp());
Get.put(FavoriteControllerim()); */

    return GetBuilder<Items_controllerImp>(
      builder: (Controller) {
//FavoriteControllerim controllerim=Get.find();

        /* if (Controller.ItemsList.isEmpty) {
          return Center(child: Text("No items found in this category."));
        } */
  //  

        return Handlingdataview(
          statusRecuest: Controller.statusRecuest,
          widget: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: Controller.ItemsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),

            itemBuilder: (BuildContext context, index) {
              // int ? i =Controller.CatogoryID;
              var Item = Controller.ItemsList[index];

             /*  var active = Item.itemsActive??0;
              controllerfa.isfavorite[Item.itemsId] = active;
 */
              return InkWell(
                onTap: () {
                  Controller.GotopageProductdetails(
                    Controller.ItemsList[index],
                  );
                },
                child: Card(
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: Hero(
                              tag: Item.itemsId.toString(),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${Applinkapi.getimageStatic}/${Item.itemsImagePath}",

                                height: 100,
                                width: 150,
                              ),
                            ),
                            ),
                            Text(
                              Item.itemsName,
                              style: TextStyle(
                                color: Appcolor.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                Item.itemsDesc.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${Item.itemsPrice}\$ ",
                                  style: TextStyle(
                                    color: Appcolor.orange,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GetBuilder<FavoriteControllerim>(
                                  builder:
                                      (controller) => IconButton(
                                        onPressed: () {
                                          if (controller.isfavorite[Item
                                                  .itemsId] ==
                                              1) {
                                            controller.setFavorite(
                                              Item.itemsId,
                                              0,
                                            );
                                            controller.RemoveFavorite(
                                              Item.itemsId,
                                            );
                                          }
                                          
                                           else {
                                            controller.setFavorite(
                                              Item.itemsId,
                                              1,
                                            );
                                            /* controller.GetfavoritesByfavoriteID(controller.data[index].favoriteID!)? 
                                           0: */
                                            controller.AddFavorite(Item.itemsId);
                                          }
                                        },

                                        icon: Icon(
                                          controller.isfavorite[Item.itemsId] ==
                                                  1
                                              //  Item.favorite==1
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                          color: Appcolor.Red,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (Item.itemsDescount != 0)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Image.asset(
                            Appimagesassent.sale,
                            height: 40,
                            width: 40,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
