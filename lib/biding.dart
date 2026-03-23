import 'package:get/get.dart';
import 'package:testproject/controller/Auth_controller/Signup_controller.dart';

class MyBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupControllerImp>(() => SignupControllerImp(), fenix: true);
  }
}
