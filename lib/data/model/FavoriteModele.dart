class MyFavoriteModele {
  int? favoriteID;
  int? favoriteItemsID;
  int? favoriteUserID;
  int? itemsID;
  String? itemsName;
  String? itemsDesc;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDescount;
  String? itemsImagePath;
  String? itemsDate;
  int? categorlesID;
  String? name;

  MyFavoriteModele(
      {this.favoriteID,
      this.favoriteItemsID,
      this.favoriteUserID,
      this.itemsID,
      this.itemsName,
      this.itemsDesc,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDescount,
      this.itemsImagePath,
      this.itemsDate,
      this.categorlesID,
      this.name});

  MyFavoriteModele.fromJson(Map<String, dynamic> json) {
    favoriteID = json['favorite_ID'];
    favoriteItemsID = json['favorite_ItemsID'];
    favoriteUserID = json['favorite_UserID'];
    itemsID = json['items_ID'];
    itemsName = json['items_Name'];
    itemsDesc = json['items_desc'];
    itemsCount = json['items_count'];
    itemsActive = json['items_Active'];
    itemsPrice = json['items_Price'];
    itemsDescount = json['items_Descount'];
    itemsImagePath = json['items_ImagePath'];
    itemsDate = json['items_date'];
    categorlesID = json['categorles_ID'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_ID'] = this.favoriteID;
    data['favorite_ItemsID'] = this.favoriteItemsID;
    data['favorite_UserID'] = this.favoriteUserID;
    data['items_ID'] = this.itemsID;
    data['items_Name'] = this.itemsName;
    data['items_desc'] = this.itemsDesc;
    data['items_count'] = this.itemsCount;
    data['items_Active'] = this.itemsActive;
    data['items_Price'] = this.itemsPrice;
    data['items_Descount'] = this.itemsDescount;
    data['items_ImagePath'] = this.itemsImagePath;
    data['items_date'] = this.itemsDate;
    data['categorles_ID'] = this.categorlesID;
    data['name'] = this.name;
    return data;
  }
}