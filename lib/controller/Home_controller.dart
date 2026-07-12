import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/core/class/StatusRecuest.dart';
import 'package:testproject/core/constant/routes.dart';
import 'package:testproject/core/functions/handlingData.dart';
import 'package:testproject/core/services/serveses.dart';
import 'package:testproject/data/datasource/remote/Home/HomeData.dart';
import 'package:testproject/data/model/itemsWithCatogery.dart';


class SearchMIXController extends GetxController {
    StatusRecuest statusRecuest = StatusRecuest.none;

  TextEditingController? search;
  bool isSearch = false;
  List<ItemsWModel> listdata = [];
  HomeData homeData = HomeData(Get.find());

  getSearchInfo() async {
    var statusRecuest = StatusRecuest.loading;
    update();

    // استدعاء الـ crud
    var response = await homeData.getsearch(search!.text);

    // التعامل مع Either
    {
      statusRecuest = handlingData(response);
      if (statusRecuest == StatusRecuest.success) {
        listdata.clear();
        //var dataresponse = response;
        if (response is List) {
          // الحالة الطبيعية: API رجعت قائمة
          listdata.addAll(
            response
                .map((e) => ItemsWModel.fromJson(Map<String, dynamic>.from(e)))
                .toList(),
          );
        } else if (response is Map) {
          // حالة خاصة: API رجعت عنصر واحد فقط على شكل Map
          listdata.add(
            ItemsWModel.fromJson(Map<String, dynamic>.from(response)),
          );
        } else {
          print("Unexpected API response type: ${response.runtimeType}");
        }
      }

      statusRecuest == StatusRecuest.success;
      update();
    }
  }

  checksearch(val) {
    if (val == "") {
statusRecuest = StatusRecuest.none;

      isSearch = false;
      update();
    }
  }

  oncearchItem() {
    isSearch = true;
    getSearchInfo();
    update();
  }

  GotoFavoritePage() {
    Get.toNamed( Approutes.Favoritepage);
  }
}

abstract class HomeController extends SearchMIXController {
  // initialdata();
  // ignore: non_constant_identifier_names
  ItemsDatawithdescunt();
  // ignore: non_constant_identifier_names
  CategoryData();
  // ignore: non_constant_identifier_names
  Gotoitmes(List categorles, int selectedcat, int CatogoryID);

  GotopageProductdetails(var ItesModel);
}

class HomeControllerImp extends HomeController {
  Myservices myservices = Get.find();

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List Categorydata = [];
  List Itemsdata = [];
  HomeData homeData = HomeData(Get.find());
  /* 
     initialdata(){
    CategoryName = myservices.sharedPreferences.getString("categorles_name");
    ID = myservices.sharedPreferences.getInt("categorles_ID");

    //=========================
    //imagepath= myservices.sharedPreferences.getString("categorles_ImagePath");
  }
 */
  @override
  void onInit() {
    search = TextEditingController();
    // homeData = HomeData();
    ItemsDatawithdescunt();
    CategoryData();
    super.onInit();
  }

  // ignore: non_constant_identifier_names
  @override
  CategoryData() async {
    statusRecuest = StatusRecuest.loading;
    update();

    var response = await homeData.getdata();
    print("== Category Response from API ==");
    print(response);

    statusRecuest = handlingData(response);
    if (statusRecuest == StatusRecuest.success) {
      Categorydata.addAll(response);
      print("== Category Response from API ==${response}");

      update();

      // نحفظ البيانات مباشرة من JSON
    }
  }

  ItemsDatawithdescunt() async {
    statusRecuest = StatusRecuest.loading;
    update();

    var response = await homeData.GetAllcateforyItemswithdescount();
    print("== Items Response from API ==");
    print(response);

    statusRecuest = handlingData(response);
    if (statusRecuest == StatusRecuest.success) {
      Itemsdata.addAll(response);
      // نحفظ البيانات مباشرة من JSON
    }
    update();
  }

  @override
  // ignore: non_constant_identifier_names
  Gotoitmes(categorles, selectedcat, CatogoryID) {
    Get.toNamed(
      Approutes.items,
      arguments: {
        "Categoreles": categorles,
        "Selectedcat": selectedcat,
        "CatogoryID": CatogoryID,
      },
    );
  }

  @override
  GotopageProductdetails(ItesModel) {
    print("🟢 Sending to Productdetails: $ItesModel");

    Get.toNamed(Approutes.Productdetails, arguments: {"ItesModel": ItesModel});
  }
}
