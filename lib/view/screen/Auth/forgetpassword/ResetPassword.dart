import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Auth_controller/ResetPassword_controller.dart';
import 'package:testproject/core/class/handlingdataview.dart';
import 'package:testproject/core/functions/validationInput.dart';
import 'package:testproject/view/widget/Auth/CustomButtonAuth.dart';
import 'package:testproject/view/widget/Auth/CustumTextBodyAuth.dart';
import 'package:testproject/view/widget/Auth/CustumTextTitleAuth.dart';
import 'package:testproject/view/widget/Auth/CustumTextformAuth.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 248, 248),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(color: Colors.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder:
            (controller) => Handlingdataview(
              statusRecuest: controller.statusRecuest,
              widget: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),

                child: Form(
                  key: controller.formstate,

                  child: ListView(
                    children: [
                      //  crossAxisAlignment: CrossAxisAlignment.start,
                      Custumtexttitleauth(texttitle: "New Password".tr),
                      SizedBox(height: 20),
                      Custumtextbodyauth(
                        text:
                            "Please Enter email New Password And Confirm Password To Reset Your Password",
                      ),
                      SizedBox(height: 50),

                      Custumtextformauth(
                        isnumber: false,
                        valid: (value) {
                          return ValdatioInput(value!, 6, 20, "email") ?? '';
                        },
                        controller: controller.email,
                        hinttext: "Enter your Email",
                        labeltext: "Email",
                        icon: Icons.email_outlined,

                        //controller: null,
                      ),
                      SizedBox(height: 10),

                      Custumtextformauth(
                        obscureText: controller.isPasswordVisible,
                        ontapicon: () {
                          controller.showpassword();
                        },

                        isnumber: false,
                        valid: (value) {
                          return ValdatioInput(value!, 6, 20, "password") ?? '';
                        },
                        controller: controller.password,
                        hinttext: "Enter your Password",
                        labeltext: "Password",
                        icon:
                            controller.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,

                        //controller: null,
                      ),
                      SizedBox(height: 10),

                      Custumtextformauth(
                        obscureText: controller.isPasswordVisible,
                        ontapicon: () {
                          controller.showpassword();
                        },

                        isnumber: false,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please re-enter your password";
                          } else if (value != controller.password.text) {
                            return "Passwords do not match";
                          }
                          return '';
                        },
                        controller: controller.repassword,
                        hinttext: "Enter re Password",
                        labeltext: "Re Password",
                        icon:
                            controller.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,

                        //controller: null,

                        //controller: null,
                      ),

                      SizedBox(height: 10),

                      CustomButtonAuth(
                        text: "Save ",
                        onPressed: () {
                          // Get.toNamed(AppRoute.home);

                          controller.GoToSuccessReSetPassword();
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
