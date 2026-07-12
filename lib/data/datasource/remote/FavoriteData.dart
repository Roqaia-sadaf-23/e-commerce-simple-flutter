import 'package:testproject/core/class/crud.dart';
import 'package:testproject/core/constant/Applinkapi.dart';

class FavoriteData {
  crud _crud = crud();
  FavoriteData(this._crud);

  AddFavorite(int UserID,int ItemID) async {
    var response = await _crud.postData(Applinkapi.FavoriteAdd,{"favorite_ItemsID":ItemID,"favorite_UserID":UserID});
    print("===================  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);
  }

// 'http://192.168.8.108:5090/api/Favorete/delete/item/4/user/1013'
  RemoveFavorite(int ItemID,int UserID) async{
    var response =await _crud.deleteData("${Applinkapi.publicApiLink}/Favorete/delete/item/$ItemID/user/$UserID");


    print("===================  delete iteme from favorite by itemID userID $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);


  }

  Future<dynamic>  deleteFavoriteByID(int FavorieID) async{
    var response =await _crud.deleteData("${Applinkapi.FavoriteDeleteByFavoriteID}/$FavorieID");


    print("===================  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);


  }
GetfavoritesByfavoriteID(int FavoriteID)async{
  var response =await _crud.getData("${Applinkapi.GetfavoritesitemsFavoriteID}/$FavoriteID");


    print("===================  Getfavorites by Favorite ID $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);

}

GetAllData(int userID)async{
  var response =await _crud.getData("${Applinkapi.GetFavoritebyuserid}/$userID");


    print("===================  data $response");
    // التعامل مع الاستجابة
    return response.fold((L) => L, (R) => R);

}


}