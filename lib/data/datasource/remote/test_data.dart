import 'package:testproject/core/class/crud.dart';
import 'package:testproject/core/constant/Applinkapi.dart';

class test_data {
  crud _crud = crud();

  test_data(this._crud);

  getdata() async {
    var response = await _crud.getData(Applinkapi.getallusers);
    print("===================  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }
} 
//===========================================
/* 
class test_data {
  crud _crud = crud();

  test_data(this._crud);

  Future<Either<StatusRecuest, List>> getdata() async {
    return await _crud.postData(Applinkapi.getallusers, []);
  }
}
 */