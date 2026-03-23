import 'package:testproject/core/class/crud.dart';
import 'package:testproject/core/constant/Applinkapi.dart';

class HomeData {
  crud _crud = crud();
  HomeData(this._crud);

  getdata() async {
    var response = await _crud.getData(Applinkapi.CategorlesData);
    print("===================  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }

  GetAllcateforyItemswithdescount() async {
    var response = await _crud.getData(
      Applinkapi.GetAllcateforyItemswithdescount,
    );
    print("===================  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }




  getsearch(String search) async {
    var response = await _crud.getData("${Applinkapi.search}/$search");
    print("===================  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }
 }


// data/datasource/remote/Home/HomeData.dart

