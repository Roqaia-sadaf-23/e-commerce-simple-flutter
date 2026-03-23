import 'package:testproject/core/class/crud.dart';
import 'package:testproject/core/constant/Applinkapi.dart';

class sginup_data {
  crud _crud = crud();

  sginup_data(this._crud);

  postDatauser(
    String username,
    String email,
    String phone,
    String password,
  ) async {
    var response = await _crud.postData(Applinkapi.adduser, {
      "name": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    print("===================  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }
}
