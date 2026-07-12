import 'package:get/get.dart';
import 'package:testproject/core/class/StatusRecuest.dart';
import 'package:testproject/core/functions/handlingData.dart';
import 'package:testproject/data/datasource/remote/test_data.dart';

class TestController extends GetxController {
  test_data _testData = test_data(Get.find());

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  List data = [];

  late StatusRecuest statusRecuest;

  getdata() async {
    statusRecuest = StatusRecuest.loading;

    var response = await _testData.getdata();
    print("===================  controller $response");

    statusRecuest = handlingData(response);
    if (statusRecuest == StatusRecuest.success) {
      data.addAll(response["data"]);
    }
    update();
  }
}

//==============================================
/* 
class TestController extends GetxController {
  test_data _testData = test_data(Get.find());

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  List data = [];
  late StatusRecuest statusRecuest;

  getdata() async {
    statusRecuest = StatusRecuest.loading;
    update();

    var response = await _testData.getdata();

    response.fold(
      (failure) {
        statusRecuest = failure;
      },
      (successData) {
        statusRecuest = StatusRecuest.success;
        data.addAll(successData);
      },
    );

    update();
  }
} */
