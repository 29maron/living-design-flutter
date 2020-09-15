class Item{
  String id;
  String name;
  String genre;
  String modelNumber;
  int price;
  String purchaseDate;  // YYYY/MM/DD形式 0埋めする
  String warrantyPeriod; // YYYY/MM/DD形式 0埋めする
  String reason;
  int comfort;
  String otherTargets;
  String memo;
  String photo;
  //todo　getterとかprimary keyとか　コンストラクターとか

  Item({
    String id,
    String name,
    String genre,
    String modelNumber,
    int price,
    String purchaseDate,  // YYYY/MM/DD形式 0埋めする
    String warrantyPeriod, // YYYY/MM/DD形式 0埋めする
    String reason,
    int comfort,
    String otherTargets,
    String memo,
    String photo,
    }){
      this.id = id;
      this.name = name;
      this.genre = genre;
      this.modelNumber = modelNumber;
      this.price = price;
      this.purchaseDate = purchaseDate;  // YYYY/MM/DD形式 0埋めする
      this.warrantyPeriod = warrantyPeriod; // YYYY/MM/DD形式 0埋めする
      this.reason = reason;
      this.comfort = comfort;
      this.otherTargets = otherTargets;
      this.memo = memo;
      this.photo = photo;
    }
}