// ignore: non_constant_identifier_names

import 'package:get/get.dart';

import '../../core/class/StatusRecuest.dart';

class CheckOut_Conroller extends GetxController {
    StatusRecuest statusRecuest = StatusRecuest.none;

 String? PaymentMethod;
  String? DeleveryType;
 String? AddressID;

CheckPaymentMethod(String? Val){
PaymentMethod=Val;
update();
}
CheckdeleveryType(String val)
{
  DeleveryType=val;
  update();
}

CheckAddress(String val){
  AddressID=val;
  update();
}

}