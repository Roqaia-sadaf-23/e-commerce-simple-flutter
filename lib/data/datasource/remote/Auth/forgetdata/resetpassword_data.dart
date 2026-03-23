import 'package:testproject/core/class/crud.dart';
import 'package:testproject/core/constant/Applinkapi.dart';

class resetpassword_data {
  crud _crud = crud();

  resetpassword_data(this._crud);

  postResetpassword(String email, String password) async {
    var response = await _crud.putData(Applinkapi.ResetPassword, {
      "email": email,
      "password": password,
    });
    print("===================  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }
}
