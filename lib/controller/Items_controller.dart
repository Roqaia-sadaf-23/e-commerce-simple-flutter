import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Favorite_controller.dart';
import 'package:testproject/controller/Home_controller.dart';
import 'package:testproject/core/class/StatusRecuest.dart';
import 'package:testproject/core/constant/routes.dart';
import 'package:testproject/core/functions/handlingData.dart';
import 'package:testproject/core/services/serveses.dart';
import 'package:testproject/data/datasource/remote/items.dart';
import 'package:testproject/data/model/itemsWithCatogery.dart';

// ignore: camel_case_types
class Items_controllerImp extends SearchMIXController {
  // ignore: non_constant_identifier_names
  List<ItemsWModel> ItemsList = [];
  List Categoreles = [];
  int? Selectedcat;
  int? CatogoryID;
  int? userID;
  ItemsData itemdata = ItemsData(Get.find());

  Myservices myservices = Get.find();

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRecuest statusRecuest = StatusRecuest.none;

  @override
  void onInit() {
    search = TextEditingController();

    //itemdata=ItemsData();
    initialData();
    super.onInit();
  }

  initialData() {
    userID = myservices.sharedPreferences.getInt("userID");
    Categoreles = Get.arguments["Categoreles"];
    Selectedcat = Get.arguments["Selectedcat"];
    CatogoryID = Get.arguments["CatogoryID"];
    GetitemsData(CatogoryID!, userID!);
  }

  changeCategory(int newindex, int catID) {
    Selectedcat = newindex;
    CatogoryID = catID;
    GetitemsData(CatogoryID!, userID!);
    update();
  }

  GetitemsData(int catID, int userID) async {
    ItemsList.clear();
    statusRecuest = StatusRecuest.loading;
    update();

    var response = await itemdata.getdata(catID, userID);
    print("== Items Response from API ==");
    print(response);

    statusRecuest = handlingData(response);

    if (statusRecuest == StatusRecuest.success) {
      if (response is List) {
        List<ItemsWModel> tempList =
            response
                .map((e) => ItemsWModel.fromJson(Map<String, dynamic>.from(e)))
                .toList();

        final seen = <int>{};
        ItemsList = tempList.where((item) => seen.add(item.itemsId)).toList();
        FavoriteControllerim controllerfa = Get.find();
        controllerfa.initializeFavorites(ItemsList);

        print("== Items is list  from API ==");
      } else if (response is Map) {
        ItemsList.add(
          ItemsWModel.fromJson(Map<String, dynamic>.from(response)),
        );
      } else {
        print("Unexpected API response type: ${response.runtimeType}");
      }
    }

    update();
  }
  /*  // ignore: non_constant_identifier_names
  GetitemsData(int catID, int userID) async {
    ItemsList.clear();
    statusRecuest = StatusRecuest.loading;
    update();

    var response = await itemdata.getdata(catID, userID);
    print("== Items Response from API ==");
    print(response);

    statusRecuest = handlingData(response);
    if (statusRecuest == StatusRecuest.success) {
      if (response is List) {
        print("== Items is list  from API ==");

        // الحالة الطبيعية: API رجعت قائمة
        ItemsList.addAll(
          response.map(
            (e) => ItemsWModel.fromJson(Map<String, dynamic>.from(e)),
          ),
        );
      } else if (response is Map) {
        // حالة خاصة: API رجعت عنصر واحد فقط على شكل Map
        ItemsList.add(
          ItemsWModel.fromJson(Map<String, dynamic>.from(response)),
        );
      } else {
        print("Unexpected API response type: ${response.runtimeType}");
      }
    }
    update();
  } */

  GotopageProductdetails(var ItesModel) {
    print("🟢 Sending to Productdetails: $ItesModel");

    Get.toNamed(Approutes.Productdetails, arguments: {"ItesModel": ItesModel});
  }
}
