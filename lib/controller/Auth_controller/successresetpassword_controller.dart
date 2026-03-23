import 'package:get/get.dart';

import 'package:testproject/core/constant/routes.dart' show Approutes;

abstract class SuccessResetPasswordController extends GetxController {
  void GoToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
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
