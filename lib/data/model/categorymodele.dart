class categorelsmodele {
  int? categorlesID;
  String? categorlesName;
  String? categorlesImagePath;
  String? categorlesDate;

  categorelsmodele(
      {this.categorlesID,
      this.categorlesName,
      this.categorlesImagePath,
      this.categorlesDate});

  categorelsmodele.fromJson(Map<String, dynamic> json) {
    categorlesID = json['categorles_ID'];
    categorlesName = json['categorles_name'];
    categorlesImagePath = json['categorles_ImagePath'];
    categorlesDate = json['categorles_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categorles_ID'] = this.categorlesID;
    data['categorles_name'] = this.categorlesName;
    data['categorles_ImagePath'] = this.categorlesImagePath;
    data['categorles_date'] = this.categorlesDate;
    return data;
  }
}