import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Productdetails_controller.dart';
import 'package:testproject/core/class/handlingdataview.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:testproject/view/widget/products/TopproductPage.dart';
import 'package:testproject/view/widget/products/price.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Productdetails_ControllerIpm Controller = Get.put(
      Productdetails_ControllerIpm(),
    );

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        height: 50,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Appcolor.babybluecolor,
          onPressed: () {
            Controller.cartController.refreshpage();
  // Controller.cartController.Add(Controller.itemsModel.itemsId);
            Controller.Gotocartpage();
          },
          child: Text(
            "Go to card",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<Productdetails_ControllerIpm>(
        builder:
            (controllerr) => Handlingdataview(
              statusRecuest: controllerr.statusRecuest,
              widget: Container(
                margin: EdgeInsetsDirectional.all(20),
                child: ListView(
                  children: [
                    Topproductpage(),

                    SizedBox(height: 200),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${Controller.itemsModel.itemsName}",
                            style: Theme.of(context).textTheme.headlineLarge!
                                .copyWith(color: Appcolor.black),
                          ),
                          custumPrice(
                            onPressedAdd: () {
                              
                              controllerr.add();
                            },
                            onPressedRemove: () {
                              
                              controllerr.remove();
                            },
                            price:
                                "${Controller.itemsModel.priceAfterDescount}"
                                "\$",
                            count: "${Controller.countItem}",
                          ),
                          Text(
                            "${Controller.itemsModel.itemsDesc}",
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(color: Appcolor.black),
                          ),
                          SizedBox(height: 10),
                          /*  Text(
                        "Color",
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(color: Appcolor.black),
                      ),
 */
                          Row(
                            children: [
                              ...List.generate(
                                Controller.subitems.length,
                                (index) => Container(
                                  margin: EdgeInsets.only(right: 10),

                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color:
                                        Controller.subitems[index]['active'] ==
                                                1
                                            ? Appcolor.babybluecolor
                                            : Appcolor.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 40,
                                  width: 60,
                                  child: Text(
                                    Controller.subitems[index]['name'],
                                    style: TextStyle(
                                      color:
                                          Controller.subitems[index]['active'] ==
                                                  1
                                              ? Appcolor.white
                                              : Appcolor.babybluecolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}















/* 

Positioned(bottom: 20,child:
 
),
                    Text(
                      "${Controller.ItemsModel["items_Price"]}",
                      style: TextStyle(
                        color: Appcolor.orange,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ), */