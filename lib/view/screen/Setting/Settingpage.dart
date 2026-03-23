import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/Setting_controller.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:testproject/core/constant/imagesassent.dart';
import 'package:testproject/core/constant/routes.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    Setting_controller controller=Get.put(Setting_controller());
    return Container(
      child: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(height: Get.width / 2, color: Appcolor.primarycolor),
              Positioned(
                top: Get.width / 3.3,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Appcolor.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Appcolor.white,
                    backgroundImage: AssetImage(Appimagesassent.personicon),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Container(
            //padding: EdgeInsets.all(10),
            child: Card(
              child: Column(
                children: [
                  ListTile(
                   // onTap: () {},
                    title: Text("Desable Notifecation"),
                    trailing: Switch(value: true, onChanged: (value){}),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Get.toNamed(Approutes.Addressview);
                    },
                    title: Text("Address"),
                    trailing: Icon(Icons.location_on_outlined),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text("About us"),
                    trailing: Icon(Icons.help_outline_outlined),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {},
                    title: Text("contant us"),
                    trailing: Icon(Icons.phone_in_talk_outlined),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {controller.Longout();},
                    title: Text("Log out"),
                    trailing: Icon(Icons.exit_to_app_outlined),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
