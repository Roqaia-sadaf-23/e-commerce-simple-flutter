import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:testproject/core/constant/routes.dart';
import 'package:testproject/core/services/serveses.dart';

class MyMiddleWare extends GetMiddleware {
  int? get priority => 1;

  Myservices myservices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
     if (myservices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: Approutes.HomeScreen);
    }
    if (myservices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: Approutes.login);
    }
    return null;
  }
}
