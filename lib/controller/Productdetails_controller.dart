import 'package:get/get.dart';
import 'package:testproject/controller/cart/Cart_controller.dart';
import 'package:testproject/core/class/StatusRecuest.dart';
import 'package:testproject/core/constant/routes.dart';
import 'package:testproject/data/model/itemsWithCatogery.dart';

// ignore: camel_case_types
abstract class Productdetails_Controller extends GetxController {
  onintialdata();
  Gotocartpage();
}

class Productdetails_ControllerIpm extends Productdetails_Controller {
  Cart_Controller cartController = Get.put(Cart_Controller());
  StatusRecuest statusRecuest = StatusRecuest.none;
  int countItem = 0;
late ItemsWModel itemsModel;
  @override
  void onInit() {
    onintialdata();
    super.onInit();
  }

  List subitems = [
    {"name": "red", "id": 1, "active": 0},
    {"name": "green", "id": 2, "active": 0},
    {"name": "Black", "id": 3, "active": 1},
    // {"name": "Blue", "id": 4, "active": 0},
  ];
  
  
  @override
  onintialdata() async {
    statusRecuest = StatusRecuest.loading;
    itemsModel = Get.arguments["ItesModel"];

    print("✅ Data received: $itemsModel");
    countItem = await cartController.GetCount(itemsModel.itemsId!);
    statusRecuest = StatusRecuest.success;
    update();
  }

  @override
  Gotocartpage() {
      add();
    Get.toNamed(Approutes.Cart);
  }

  add() {
    if (countItem >= 0) {
      cartController.Add(itemsModel.itemsId!);
      countItem++;
    }
    update();
  }

  remove() {
    if (countItem > 0) {
      cartController.Delete(itemsModel.itemsId!);
      countItem--;
    }
    update();
  }
}
