// ignore: file_names
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:testproject/core/class/StatusRecuest.dart';
import 'package:testproject/core/constant/routes.dart';
import 'package:testproject/core/functions/handlingData.dart';
import 'package:testproject/core/services/serveses.dart';
import 'package:testproject/data/datasource/remote/Auth/logindata.dart';

abstract class LoginController extends GetxController {
  login();
  // ignore: non_constant_identifier_names
  GoToSgnUp();
  // ignore: non_constant_identifier_names
  GoToResetPassword();
}

class LoginControllerImp extends LoginController {
  login_data logindata = login_data(Get.find());
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  StatusRecuest statusRecuest = StatusRecuest.none;
  Myservices myservices = Get.find();
  bool isPasswordVisible = true;
  showpassword() {
    isPasswordVisible = isPasswordVisible == false ? true : false;
    update();
  }

  void login() async {
    if (formstate.currentState!.validate()) {
      statusRecuest = StatusRecuest.loading;
      update();

      var response = await logindata.postIsuserexit(email.text, password.text);
      print("=================== login controller $response");

      statusRecuest = handlingData(response);
      if (statusRecuest == StatusRecuest.success) {
        if (response['userID'] != null) {
          myservices.sharedPreferences.setInt("userID", response['userID']);
          myservices.sharedPreferences.setString("name", response['name']);
          myservices.sharedPreferences.setString("email", response['email']);
          myservices.sharedPreferences.setString("email", response['email']);
          myservices.sharedPreferences.setString("step", "2");

          Get.offNamed(Approutes.Homepage);
        } else {
          Get.defaultDialog(
            title: "Login Failed",
            middleText: "Email or password is incorrect.",
          );
        }
      } else {
        Get.defaultDialog(
          title: "Error",
          middleText: "Server error. Please try again later.",
        );
      }

      update();
    }
  }

  @override
  GoToSgnUp() {
    Get.offNamed(Approutes.login);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("========================================");
      print(value);
      print("========================================");
      // String? token=value;
    });

    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  GoToResetPassword() {
    Get.toNamed(Approutes.ResetPassword);
  }
}
