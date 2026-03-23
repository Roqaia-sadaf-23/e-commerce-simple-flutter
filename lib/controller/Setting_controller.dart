import 'package:get/get.dart';
import 'package:testproject/core/constant/routes.dart';
import 'package:testproject/core/services/serveses.dart';

class Setting_controller extends GetxController{

  Myservices myservices=Get.find();
  Longout(){
    myservices.sharedPreferences.clear();
    Get.toNamed(Approutes.login);
  }
}