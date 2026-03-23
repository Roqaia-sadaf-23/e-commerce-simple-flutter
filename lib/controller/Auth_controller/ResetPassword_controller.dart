import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:testproject/core/class/StatusRecuest.dart';
import 'package:testproject/core/constant/routes.dart';
import 'package:testproject/core/functions/handlingData.dart';

import '../../data/datasource/remote/Auth/forgetdata/resetpassword_data.dart';

abstract class ResetPasswordController extends GetxController {
  ReSetPassword();
  GoToSuccessReSetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late resetpassword_data resetpasswordData = resetpassword_data(Get.find());

  StatusRecuest statusRecuest = StatusRecuest.none;
  List data = [];

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController repassword;

  bool isPasswordVisible = true;
  showpassword() {
    isPasswordVisible = isPasswordVisible == false ? true : false;
    update();
  }

  @override
  ReSetPassword() {
    //Get.toNamed(Approutes.Signup);
  }
  @override
  GoToSuccessReSetPassword() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRecuest = StatusRecuest.loading;
      update();
      var response = await resetpasswordData.postResetpassword(
        email.text,
        password.text,
      );
      print("=================== sginup controller $response");

      statusRecuest = handlingData(response);
      if (statusRecuest == StatusRecuest.success) {
        // data.addAll(response);
        Get.offNamed(Approutes.SuccessReSetPassword);
      } else {
        Get.defaultDialog(
          title: "Error",
          middleText: "There was an error during signup. Please try again.",
          /* confirm: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ), */
        );
      }
      update();
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
