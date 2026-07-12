// ignore: file_names
import 'package:get/get.dart';
import 'package:testproject/core/class/crud.dart';

import '../controller/Favorite_controller.dart';

// ignore: camel_case_types
class initialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(crud());
    Get.put(FavoriteControllerim());
  }
}
