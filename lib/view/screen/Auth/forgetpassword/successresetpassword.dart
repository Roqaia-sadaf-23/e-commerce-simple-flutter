import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Auth_controller/successresetpassword_controller.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:testproject/view/widget/Auth/CustomButtonAuth.dart';

class SuccessResetPassrord extends StatefulWidget {
  const SuccessResetPassrord({super.key});

  @override
  State<SuccessResetPassrord> createState() => _SuccessResetPassrordState();
}

class _SuccessResetPassrordState extends State<SuccessResetPassrord> {
  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(
      SuccessResetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 248, 248),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Success',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(color: Colors.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 200,
                    color: Appcolor.primarycolor,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Congratulations",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Appcolor.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Your account has been created successfully Go to the login page",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Appcolor.black),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "Go to Login",
                onPressed: () {
                  controller.GoToLogin();
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
