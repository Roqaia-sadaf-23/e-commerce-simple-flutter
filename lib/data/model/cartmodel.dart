class CartModel {
  final int itemsID;
  final String itemsName;
  final String? itemsDesc;
  final int? itemsActive;
  final double itemsPrice;
  final int? itemsDescount;
  final String? itemsImagePath;
  final String itemsDate;
  final int categorlesID;
  final int usersID;
  final double? sumitemsprice;
  final int? countitems;
  final double? priceafterdescount;

  CartModel({
    required this.itemsID,
    required this.itemsName,
    this.itemsDesc,
    this.itemsActive,
    required this.itemsPrice,
    this.itemsDescount,
    this.itemsImagePath,
    required this.itemsDate,
    required this.categorlesID,
    required this.usersID,
    this.sumitemsprice,
    this.countitems,
    this.priceafterdescount,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      itemsID: json['items_ID'] ?? 0,
      itemsName: json['items_Name'] ?? '',
      itemsDesc: json['items_desc'],
      itemsActive: json['items_Active'],
      itemsPrice: (json['items_Price'] ?? 0).toDouble(),
      itemsDescount: json['items_Descount'],
      itemsImagePath: json['items_ImagePath'],
      itemsDate: json['items_date'] ?? '',
      categorlesID: json['categorles_ID'] ?? 0,
      usersID: json['users_ID'] ?? 0,
      sumitemsprice: (json['sumitemsprice'] as num?)?.toDouble(),
      countitems: json['countitems'],
      priceafterdescount: (json['priceafterdescount'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items_ID': itemsID,
      'items_Name': itemsName,
      'items_desc': itemsDesc,
      'items_Active': itemsActive,
      'items_Price': itemsPrice,
      'items_Descount': itemsDescount,
      'items_ImagePath': itemsImagePath,
      'items_date': itemsDate,
      'categorles_ID': categorlesID,
      'users_ID': usersID,
      'sumitemsprice': sumitemsprice,
      'countitems': countitems,
      'priceafterdescount': priceafterdescount,
    };
  }
}
