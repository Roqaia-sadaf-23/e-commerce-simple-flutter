import 'package:get/get.dart';

import 'package:testproject/core/constant/routes.dart' show Approutes;

abstract class SuccessSignUpController extends GetxController {
  void GoToLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  GoToLogin() {
    Get.offAllNamed(Approutes.login);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
