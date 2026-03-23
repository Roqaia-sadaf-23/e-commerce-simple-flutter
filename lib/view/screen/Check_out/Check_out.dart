import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/core/class/handlingdataview.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:testproject/core/constant/imagesassent.dart';
import 'package:testproject/view/screen/Check_out/DriveType.dart';
import 'package:testproject/view/widget/Checkout/PaymentMethod.dart';

import '../../../controller/Checkout/CheckOut_Conroller.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOut_Conroller Controller = Get.put(CheckOut_Conroller());
    return Scaffold(
      appBar: AppBar(title: const Text("CheckOut")),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        // margin: EdgeInsets.all(15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Appcolor.babybluecolor,
          ),
          // textColor: Colors.black,
          onPressed: () {},
          child: Text(
            "Checkout",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),

      body: GetBuilder<CheckOut_Conroller>(
        builder:
            (controller) => Handlingdataview(
              statusRecuest: controller.statusRecuest,
              widget: Container(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    /// Title: Payment Method
                    const Text(
                      "Choose Payment Method",
                      style: TextStyle(color: Appcolor.black, fontSize: 20),
                    ),

                    const SizedBox(height: 15),

                    // Option 1: Cash
                    InkWell(
                      onTap: () {
                        Controller.CheckPaymentMethod("Cash");
                      },
                      child: Paymentmethod(
                        title: "Cash payment",
                        IsActive:controller.PaymentMethod==("Cash")? true:false,
                      ),
                    ),
                    // Option 2: Payment Cards
                    InkWell(
                      onTap: () {
                        Controller.CheckPaymentMethod("Card");
                      },

                      child: Paymentmethod(
                        title: "Card Payment",
                        IsActive: controller.PaymentMethod==("Card")? true:false,
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// Title: Delivery Type
                    const Text(
                      "Choose Delivery Type",
                      style: TextStyle(color: Appcolor.black, fontSize: 20),
                    ),

                    const SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.CheckdeleveryType("Delivery");
                            },
                            child: DriveType(
                              title: "Delivery",
                              imageName: Appimagesassent.onboardingdelivery,
                              isActive: controller.DeleveryType==("Delivery")?true:false,
                            ),
                          ),
                          SizedBox(width: 15),
                          InkWell(
                            onTap: () {
                              controller.CheckdeleveryType("DriveThrow");
                            },
                            child: DriveType(
                              title: "DriveThrow",
                              imageName: Appimagesassent.DriveThrow,
                              isActive: controller.DeleveryType==("DriveThrow")?true:false,
                            ),
                          ),

                          SizedBox(width: 15),
                          DriveType(
                            title: "DriveThrow",
                            imageName: Appimagesassent.DriveThrow,
                            isActive: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Shiping Address",
                      style: TextStyle(color: Appcolor.black, fontSize: 20),
                    ),

                    const SizedBox(height: 15),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: const ListTile(
                        title: Text("Home"),
                        subtitle: Text("Madina Street one Building 36"),
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
