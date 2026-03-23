import 'package:testproject/core/class/crud.dart';
import 'package:testproject/core/constant/Applinkapi.dart';

class Cartdata {
  crud _crud = crud();
  Cartdata(this._crud);

  Add(int UserID, int ItemID) async {
    var response = await _crud.postData(Applinkapi.CartAdd,
     {
      "card_ItemsID": ItemID,
      "card_UserID": UserID,
    });
    print("=================== add data $response");
    return response.fold((L) => L, (R) => R);
  }

  RemoveCart(int UserID, int ItemID) async {
    var response = await _crud.deleteData(
      "${Applinkapi.CartDelete}/$ItemID/$UserID",
    );

    print("===================  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }

  GetCartDataByItemid(int Itemid) async {
    var response = await _crud.getData("${Applinkapi.GetCartbyItemID}/$Itemid");

    print("===================  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }

  GetcountItem(int Itemid, int UserID) async {
    var response = await _crud.getDataWmap(
      "${Applinkapi.GetCountItems}/$Itemid/$UserID",
    );

    print("=================== count itmes = $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }

  getAll(int UserID) async {
    var response = await _crud.getData("${Applinkapi.GetAllCartInfo}/$UserID");

    print("=================== count itmes = $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }

  getAllTotalprice(int UserID) async {
    var response = await _crud.getDataWmap(
      "${Applinkapi.GetTatalByuserID}/$UserID",
    );

    print("=================== count itmes = $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }
}
