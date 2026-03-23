import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Auth_controller/Signup_controller.dart';
import 'package:testproject/core/class/handlingdataview.dart';
import 'package:testproject/core/functions/alirtexitapp.dart';
import 'package:testproject/core/functions/validationInput.dart';
import 'package:testproject/view/widget/Auth/CustomButtonAuth.dart';
import 'package:testproject/view/widget/Auth/CustomTextSignupORSignin.dart';
import 'package:testproject/view/widget/Auth/CustumTextBodyAuth.dart';
import 'package:testproject/view/widget/Auth/CustumTextTitleAuth.dart';
import 'package:testproject/view/widget/Auth/CustumTextformAuth.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController contr = TextEditingController();
    //Get.lazyPut<SignupControllerImp>(() => SignupControllerImp());
    Get.put(SignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 248, 248),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(color: Colors.grey),
        ),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () => alirtExitApp(),
        child: GetBuilder<SignupControllerImp>(
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
                        //Logoauth(),

                        //  crossAxisAlignment: CrossAxisAlignment.start,
                        Custumtexttitleauth(texttitle: "2".tr),
                        SizedBox(height: 20),
                        Custumtextbodyauth(
                          text:
                              "Sign up With your Email And Password OR Continue With Social Media",
                        ),
                        SizedBox(height: 30),
                        Custumtextformauth(
                          isnumber: false,
                          valid: (value) {
                            return ValdatioInput(value!, 3, 20, "username") ??
                                '';
                          },
                          controller: controller.username,
                          hinttext: "Enter Your UserName",
                          labeltext: "UserName",
                          icon: Icons.person_outline,

                          //controller: null,
                        ),
                        SizedBox(height: 10),
                        Custumtextformauth(
                          isnumber: false,
                          valid: (value) {
                            return ValdatioInput(value!, 3, 20, "email") ?? '';
                          },

                          controller: controller.email,
                          hinttext: "Enter your Email",
                          labeltext: "Email",
                          icon: Icons.email_outlined,

                          //controller: null,
                        ),
                        SizedBox(height: 10),
                        Custumtextformauth(
                          isnumber: true,
                          valid: (value) {
                            return ValdatioInput(value!, 3, 20, "phone") ?? '';
                          },
                          controller: controller.phone,
                          hinttext: "Enter your phone number",
                          labeltext: "Phone Number",
                          icon: Icons.phone_android_outlined,

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
                            return ValdatioInput(value!, 6, 20, "password") ??
                                '';
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

                        CustomButtonAuth(
                          text: "Sign Up",
                          onPressed: () {
                            controller.GoToSgnUp();
                            // Get.toNamed(AppRoute.home);
                          },
                        ),

                        SizedBox(height: 10),
                        Customtextsignuporsignin(
                          textone: " have an account?",
                          texttwo: "Login",
                          onTap: () {
                            controller.GoToSgnIn();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
