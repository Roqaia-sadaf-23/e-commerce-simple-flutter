class ItemsWModel {
  final int itemsId;
  final String itemsName;
  final String? itemsDesc;
  final int itemsCount;
  final int? itemsActive;
  final double itemsPrice;
  final int? itemsDescount;
  final String? itemsImagePath;
  final String itemsDate;
  final int categorlesId;
  final int? favorite;
  final String categorlesName;
  final String categorlesImagePath;
  final String categorlesDate;
  final double? priceAfterDescount;

  ItemsWModel({
    required this.itemsId,
    required this.itemsName,
    required this.itemsDesc,
    required this.itemsCount,
    required this.itemsActive,
    required this.itemsPrice,
    required this.itemsDescount,
    required this.itemsImagePath,
    required this.itemsDate,
    required this.categorlesId,
    required this.favorite,
    required this.categorlesName,
    required this.categorlesImagePath,
    required this.categorlesDate,
    required this.priceAfterDescount,
  });

  factory ItemsWModel.fromJson(Map<String, dynamic> json) {
    return ItemsWModel(
      itemsId: json['items_ID'] ?? 0,
      itemsName: json['items_Name'] ?? '',
      itemsDesc: json['items_desc'],
      itemsCount: json['items_count'] ?? 0,
      itemsActive: json['items_Active'],
      itemsPrice: (json['items_Price'] ?? 0).toDouble(),
      itemsDescount: json['items_Descount'],
      itemsImagePath: json['items_ImagePath'],
      itemsDate: json['items_date'] ?? '',
      categorlesId: json['categorles_ID'] ?? 0,
      favorite: json['favorite'] ?? 0,
      categorlesName: json['categorles_name'] ?? '',
      categorlesImagePath: json['categorles_ImagePath'] ?? '',
      categorlesDate: json['categorles_date'] ?? '',
      priceAfterDescount:
          json['priceafterdescount'] != null
              ? (json['priceafterdescount'] as num).toDouble()
              : null,
    );
  }
}
