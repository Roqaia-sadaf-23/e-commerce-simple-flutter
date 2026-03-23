import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Auth_controller/verfiycodesginup_controller.dart';
import 'package:testproject/view/widget/Auth/CustumTextBodyAuth.dart';
import 'package:testproject/view/widget/Auth/CustumTextTitleAuth.dart';

class VerfiyCodeSginUp extends StatelessWidget {
  const VerfiyCodeSginUp({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController contr = TextEditingController();
    final VerfiyCodeSginUpControllerImp controller = Get.put(
      VerfiyCodeSginUpControllerImp(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 248, 248),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Verification Code',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(color: Colors.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),

        child: ListView(
          children: [
            //Logoauth(),

            //  crossAxisAlignment: CrossAxisAlignment.start,
            Custumtexttitleauth(texttitle: "Chck Code".tr),
            SizedBox(height: 20),
            Custumtextbodyauth(
              text: "Please Enter The Digit Code Sent To Your Email Address",
            ),
            SizedBox(height: 30),
            OtpTextField(
              fieldHeight: 80,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.GoToSuccesssignupcode();
              }, // end onSubmit
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
