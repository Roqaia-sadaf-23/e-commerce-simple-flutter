import 'package:get/get.dart';
import 'package:testproject/core/class/StatusRecuest.dart';
import 'package:testproject/core/functions/handlingData.dart';
import 'package:testproject/core/services/serveses.dart';
import 'package:testproject/data/datasource/remote/FavoriteData.dart';
import 'package:testproject/data/model/FavoriteModele.dart';

import '../data/model/itemsWithCatogery.dart';
class FavoriteController  extends GetxController {  
 
}
class FavoriteControllerim extends  FavoriteController{
 List<MyFavoriteModele> data = [];
  Myservices myservices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());
  Rx<StatusRecuest> statusRecuest = StatusRecuest.none.obs;
 Map<int, int> isfavorite = {};

  void initializeFavorites(List<ItemsWModel> items) {
    for (var item in items) {
      isfavorite[item.itemsId] = item.itemsActive !;
    }
  }

  @override
  void onInit() {
    GetFavoriteWithItemData();
    super.onInit();
  }

  /// تغيير حالة القلب في الصفحة
  void setFavorite(int id, int value) {
    isfavorite[id] = value;
    update();
  }

  Future<void> AddFavorite(int itemID) async {
    
    var response = await favoriteData.AddFavorite(
      myservices.sharedPreferences.getInt("userID")!,
      itemID,
    );

    statusRecuest = handlingData(response);
    if (statusRecuest == StatusRecuest.success) {
           print("++++++Product Add to favorites@@@");

     // isfavorite[itemID] = 1;
    /*  Get.snackbar(
  "Success",
  "Product deleted from favorites",
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Appcolor.orange,
  colorText: Colors.white,
); */
      update();
    }
  }

  /// حذف منتج من المفضلة بالـ ItemID
  Future<void> RemoveFavorite(int itemID) async {
    var response = await favoriteData.RemoveFavorite(itemID,myservices.sharedPreferences.getInt("userID")!,
   
    );

   // statusRecuest = handlingData(response);
statusRecuest.value = handlingData(response);
    
    if (statusRecuest == StatusRecuest.success) {
     print("++++++Product removed from favorites@@@");
     var deletedItem = data.firstWhereOrNull(
        (e) => e.itemsID == itemID ,
      );

      if (deletedItem != null) {
        isfavorite[deletedItem.itemsID!] = 0;
        data.remove(deletedItem);
      } 
if (statusRecuest == StatusRecuest.success) {
      isfavorite[itemID] = 0;
      data.removeWhere((e) => e.itemsID == itemID); 
  /*     Get.snackbar(
  "Removed",
  "Product removed from favorites",
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Appcolor.Red,
  colorText: Colors.white,
); */ 
      update();
    }
  }

  }
/* 
  Future<void> DeleteFavoriteByID(int favoriteID) async {
    var response = await favoriteData.GetfavoritesByfavoriteID(favoriteID);
   // statusRecuest = handlingData(response);
statusRecuest.value = handlingData(response);
    if (statusRecuest == StatusRecuest.success) {
      var deletedItem = data.firstWhereOrNull(
        (e) => e.favoriteID == favoriteID,
      );

      if (deletedItem != null) {
       isfavorite[deletedItem.itemsID!] = 0;
        data.remove(deletedItem);
      }
/* 
      Get.snackbar(
  "Removed",
  "Product removed from favorites",
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Appcolor.Red,
  colorText: Colors.white,
); */
      update();
    }
  } */
Future<void> DeleteFavoriteByID(int favoriteID) async {
  var response = await favoriteData.deleteFavoriteByID(favoriteID);
  // لا تغيّر statusRecuest هنا، لأننا نحذف من الـ list فقط
  if (response != null) {
    var deletedItem = data.firstWhereOrNull((e) => e.favoriteID == favoriteID);
    if (deletedItem != null) {
      isfavorite[deletedItem.itemsID!] = 0;
      data.remove(deletedItem); // هذا كافي لتحديث UI
    }
  }
}

  /// جلب جميع بيانات المفضلة
  Future<void> GetFavoriteWithItemData() async {
    data.clear();
    //isfavorite.clear();
  //  statusRecuest = StatusRecuest.loading;
   
    update();

    var response = await favoriteData.GetAllData(
      myservices.sharedPreferences.getInt("userID")!,
    );
   // statusRecuest = handlingData(response);
 statusRecuest.value = handlingData(response);

    if (statusRecuest == StatusRecuest.success) {
      if (response is List) {
        data.addAll(
          response.map((e) 
          => MyFavoriteModele.fromJson(Map<String, dynamic>.from(e))).toList());
     for (var item in data) {
        if (item.itemsActive != 0) {
          isfavorite[item.itemsID!] = 1;
        }}
      }else{
        print("error favoritebData statusRecuest");
      }

     //isfavorite
       
   update();  
   }
   
  }
  
  
  }
