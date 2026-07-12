import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/core/constant/colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:testproject/core/constant/routes.dart';
class Addressview extends StatelessWidget {
  const Addressview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {Get.toNamed(Approutes.Addaddress);},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
         title: Text("Address"),
        //backgroundColor: Appcolor.primarycolor,
      ),

      body: ListView(children: [Container(child: Text("data"))]),
    );
  }
}
