import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/core/class/StatusRecuest.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:testproject/core/functions/handlingData.dart';
import 'package:testproject/core/services/serveses.dart';
import 'package:testproject/data/datasource/remote/cart/cartData.dart';
import 'package:testproject/data/model/cartmodel.dart';

// ignore: camel_case_types
class Cart_Controller extends GetxController {
  Myservices myservices = Get.find();
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRecuest statusRecuest = StatusRecuest.none;
  Cartdata cartdata = Cartdata(Get.find());
  List<CartModel> data = [];
  double Totalprice = 0.0;
  int Totalcount = 0;

  @override
  void onInit() {
    getAllCartInfo();
    super.onInit();
  }

  Add(int itemID) async {
    statusRecuest = StatusRecuest.loading;
    update();

    var response = await cartdata.Add(
      myservices.sharedPreferences.getInt("userID")!,
      itemID,
    );
    print("===================Adding to cart itemID: $itemID");
    print(response);

    statusRecuest = handlingData(response);
    if (statusRecuest == StatusRecuest.success) {
      Get.rawSnackbar(
        title: "Warning ",
        messageText: const Text(
          "You added a product to cart",
          style: TextStyle(color: Appcolor.white),
        ),
      );
    }

    statusRecuest = StatusRecuest.success;
    update();
  }

  Delete(int itemID) async {
    statusRecuest = StatusRecuest.loading;
    update();

    var response = await cartdata.RemoveCart(
      myservices.sharedPreferences.getInt("userID")!,
      itemID,
    );
    print("===================Deleting product from cart itemID: $itemID");
    print(response);

    statusRecuest = handlingData(response);
    if (statusRecuest == StatusRecuest.success) {
      Get.rawSnackbar(
        title: "Warning ",
        messageText: const Text(
          "You removed a product from cart",
          style: TextStyle(color: Appcolor.white),
        ),
      );
    }

    statusRecuest = StatusRecuest.success;
    update();
  }
  /* 
  getTotalpricebyuserid() async {
    var response = await cartdata.getAllTotalprice(
      myservices.sharedPreferences.getInt("userID")!,
    );

    statusRecuest = handlingData(response);
    if (statusRecuest == StatusRecuest.success) {
      Map totaresponse = response["totaprice"];
      Totalprice = totaresponse["sumitemsprice"];
      Totalcount = totaresponse["countitems"];
      print("=================== total price $totaresponse **************");
    }

    statusRecuest = StatusRecuest.success;
    update();
  }
 */

  getTotalpricebyuserid() async {
    var response = await cartdata.getAllTotalprice(
      myservices.sharedPreferences.getInt("userID")!,
    );

    statusRecuest = handlingData(response);
    if (statusRecuest == StatusRecuest.success) {
      Map totaresponse = response["totaprice"];
      Totalprice = (totaresponse["totalprice"] ?? 0).toDouble();
      Totalcount = (totaresponse["totalcount"] ?? 0).toInt();

      print("=================== total price $totaresponse **************");
    }

    statusRecuest = StatusRecuest.success;
    update();
  }

  GetCount(int itemID) async {
    int counter = 0;
    var response = await cartdata.GetcountItem(
      itemID,
      myservices.sharedPreferences.getInt("userID")!,
    );
    print("=================== itemID: $itemID");
    print(response);

    statusRecuest = handlingData(response);
    if (statusRecuest == StatusRecuest.success) {
      counter = response["countItem"];
      print("get count of $counter");
      return counter;
    }
    return counter;
  }

  reseatcarddata() {
    Totalcount = 0;
    Totalprice = 0;
    data.clear();
  }

  refreshpage() {
    reseatcarddata();
    getAllCartInfo();
  }

  getAllCartInfo() async {
    statusRecuest = StatusRecuest.loading;
    update();

    var response = await cartdata.getAll(
      myservices.sharedPreferences.getInt("userID")!,
    );

    statusRecuest = handlingData(response);
    if (statusRecuest == StatusRecuest.success) {
      data.clear(); // ✅ تنظيف القائمة قبل الإضافة
      if (response is List) {
        data.addAll(
          response
              .map((e) => CartModel.fromJson(Map<String, dynamic>.from(e)))
              .toList(),
        );
      } else if (response is Map) {
        data.add(CartModel.fromJson(Map<String, dynamic>.from(response)));
      }
      await getTotalpricebyuserid();
    }

    statusRecuest = StatusRecuest.success; // ✅ تصحيح الخطأ
    update();
  }
}
