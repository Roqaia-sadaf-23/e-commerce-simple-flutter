import 'package:get/get.dart';
import 'package:testproject/core/constant/routes.dart';

abstract class VerfiyCodeSginUpController extends GetxController {
  CheckCode();
  GoToSuccesssignupcode();
}

class VerfiyCodeSginUpControllerImp extends VerfiyCodeSginUpController {
  late String code;

  @override
  GoToSuccesssignupcode() {
    Get.offNamed(Approutes.SuccessSignup);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  CheckCode() {}
}
