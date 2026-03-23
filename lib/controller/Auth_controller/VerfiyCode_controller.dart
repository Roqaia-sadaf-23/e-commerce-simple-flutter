import 'package:get/get.dart';
import 'package:testproject/core/constant/routes.dart';

abstract class VerfiyCodeController extends GetxController {
  CheckCode();
  GoToresetpassword();
}

class VerfiyCodeControllerImp extends VerfiyCodeController {
  late String code;

  @override
  GoToresetpassword() {
    Get.offNamed(Approutes.ResetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  CheckCode() {}
}
