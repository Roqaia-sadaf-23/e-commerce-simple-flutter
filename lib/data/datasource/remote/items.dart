import 'package:testproject/core/class/crud.dart';
import 'package:testproject/core/constant/Applinkapi.dart';

class ItemsData {
 crud _crud = crud();
ItemsData(this._crud); 
getdata(int Idcategory,int userID) async {
    var response = await _crud.getData("${Applinkapi.GetItemsByCategoryId}/$Idcategory/$userID");
    print("**************  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }
}