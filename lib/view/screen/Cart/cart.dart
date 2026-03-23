 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/cart/Cart_controller.dart';
import 'package:testproject/core/class/handlingdataview.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:testproject/view/widget/Cart/CustomCartProductList.dart';
import 'package:testproject/view/widget/Cart/Topappbarcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
      Get.put(Cart_Controller());

    return Scaffold(
      appBar: AppBar(
        title: Text("My Card"),
      ),
       bottomNavigationBar: GetBuilder<Cart_Controller>(
        builder: (controller) =>
         Topappbarcart(
          price: controller.Totalprice,
          shipping: "20",
          Totalprice: controller.Totalprice,
        ),
      ),

      body: GetBuilder<Cart_Controller>(
        builder: (controller) => Handlingdataview(
          statusRecuest: controller.statusRecuest,
          widget: ListView(
            children: [
             
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Appcolor.babybluecolor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "You have ${controller.Totalcount} Items in your List ",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Appcolor.black),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    ...List.generate(
                      controller.data.length,
                      (index) => Customcartproductlist(
                        name: controller.data[index].itemsName,
                        price: (controller.data[index].priceafterdescount ?? 0).toString(),
                        count: (controller.data[index].countitems ?? 0).toString(),
                        imagename: controller.data[index].itemsImagePath ?? "",
                        onAdd: ()
                         async {
                          await controller.Add(controller.data[index].itemsID);
                          controller.refreshpage();
                        },
                        onRemode: () 
                        async {
                          await controller.Delete(controller.data[index].itemsID);
                          controller.refreshpage();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
