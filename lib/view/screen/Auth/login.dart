import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Auth_controller/Login_controller.dart';
import 'package:testproject/core/class/handlingdataview.dart';
import 'package:testproject/core/functions/alirtexitapp.dart';
import 'package:testproject/core/functions/validationInput.dart';
import 'package:testproject/view/widget/Auth/CustomButtonAuth.dart';
import 'package:testproject/view/widget/Auth/CustomTextSignupORSignin.dart';
import 'package:testproject/view/widget/Auth/CustumTextBodyAuth.dart';
import 'package:testproject/view/widget/Auth/CustumTextTitleAuth.dart';
import 'package:testproject/view/widget/Auth/CustumTextformAuth.dart';
import 'package:testproject/view/widget/Auth/LogoAuth.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 248, 248),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Login',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(color: Colors.grey),
        ),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () => alirtExitApp(),
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) {
            return Handlingdataview(
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
                      Logoauth(),

                      //  crossAxisAlignment: CrossAxisAlignment.start,
                      Custumtexttitleauth(texttitle: "2".tr),
                      SizedBox(height: 20),
                      Custumtextbodyauth(
                        text:
                            "Sign In With your Email And Password OR Continue With Social Media",
                      ),
                      SizedBox(height: 46),
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
                      SizedBox(height: 19),
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
                        hinttext: "Enter your password",
                        labeltext: "Password",
                        icon:
                            controller.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,

                        //controller: null,
                      ),
                      InkWell(
                        onTap: () {
                          controller.GoToResetPassword();
                        },

                        child: Text(
                          "Forget password",
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      CustomButtonAuth(
                        text: "Login",
                        onPressed: () {
                          // Get.toNamed(AppRoute.home);
                          controller.login();
                        },
                      ),

                      SizedBox(height: 10),
                      Customtextsignuporsignin(
                        textone: "Don't have an account?",
                        texttwo: "Sign Up",
                        onTap: () {
                          controller.GoToSgnUp();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
