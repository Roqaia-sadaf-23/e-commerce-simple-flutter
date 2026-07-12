import 'package:testproject/core/class/crud.dart';
import 'package:testproject/core/constant/Applinkapi.dart';

class login_data {
  crud _crud = crud();

  login_data(this._crud);

  postIsuserexit(String email, String password) async {
    var response = await _crud.postData(Applinkapi.login, {
      "email": email,
      "password": password,
    });
    print("===================  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }
}
