import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/view/screen/Home/homepage.dart';
import 'package:testproject/view/screen/Notvications.dart';
import 'package:testproject/view/screen/Profile/Profile.dart';
import 'package:testproject/view/screen/Setting/Settingpage.dart';

abstract class HomeScreen_controller extends GetxController {
  changepage(int currentpage);
}

class HomeScreen_controllerImp extends HomeScreen_controller {
  int currenttpage = 0;

  List<Widget> Listpage = [
    const Homepage(),   
     const Notvications(),
     const Profile(),
   const Setting(),

  ];

  List buttonappbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Notis", "icon": Icons.notifications_active_outlined},
    {"title": "Profile", "icon": Icons.person},
    {"title": "settings", "icon": Icons.settings}
  ];
  @override
  void changepage(int i) {
    currenttpage = i;
    update(); 
  }
}

