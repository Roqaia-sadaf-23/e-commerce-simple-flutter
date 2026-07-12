import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/cart/Cart_controller.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:testproject/core/constant/routes.dart';
import 'package:testproject/view/widget/Cart/bttonOrder.dart';

class Topappbarcart extends GetView<Cart_Controller> {
final double price;
final String shipping;
final double Totalprice;

  const Topappbarcart({super.key, required this.price, required this.shipping, required this.Totalprice});

  @override
  Widget build(BuildContext context) {
    return     
       Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.all(10),
            //  padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border: BoxBorder.all(color: Appcolor.primarycolor),
              borderRadius: BorderRadius.circular(10),
              ),
              
              child:Column( children: [ Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("price", style: TextStyle(fontSize: 20)),
                Text("$price\$", style: TextStyle(fontSize: 20)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Text("shaping", style: TextStyle(fontSize: 20)),
                Text("$shipping\$", style: TextStyle(fontSize: 20)),
              ],
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(color: Appcolor.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Text("Total", style: TextStyle(fontSize: 20)),
                Text("$Totalprice\$", style: TextStyle(fontSize: 20)),
              ],
            ),],)
),
            Container(
              child: Custumbottuncart(
                textbutton: 'order',
                onPressed: () {
                  Get.toNamed(Approutes.CheckOut);
                },
                backcolor: Appcolor.babybluecolor,
              ),
            ),
          ],
        ),
      );
  }
}