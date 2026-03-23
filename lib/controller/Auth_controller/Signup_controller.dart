import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:testproject/core/class/StatusRecuest.dart';
import 'package:testproject/core/constant/routes.dart';
import 'package:testproject/core/functions/handlingData.dart';
import 'package:testproject/data/datasource/remote/Auth/sginupdata.dart';

abstract class SignupController extends GetxController {
  GoToSgnUp();
  GoToSgnIn();
}

class SignupControllerImp extends SignupController {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRecuest statusRecuest = StatusRecuest.none;
  List data = [];
  late sginup_data sginupData;

  bool isPasswordVisible = true;
  showpassword() {
    isPasswordVisible = isPasswordVisible == false ? true : false;
    update();
  }

  @override
  GoToSgnUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRecuest = StatusRecuest.loading;
      update();
      var response = await sginupData.postDatauser(
        username.text,
        email.text,
        phone.text,
        password.text,
      );
      print("=================== sginup controller $response");

      statusRecuest = handlingData(response);
      if (statusRecuest == StatusRecuest.success) {
        // data.addAll(response);
        Get.offNamed(Approutes.VarfiyCodeSginUp);
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
  GoToSgnIn() {
    Get.offNamed(Approutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    sginupData = sginup_data(Get.find());
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
