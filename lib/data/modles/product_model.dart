import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<Map<String, String?>> mainProducts;
  List<SecondeProduct> secondeProducts;

  ProductModel({
    required this.mainProducts,
    required this.secondeProducts,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    mainProducts: List<Map<String, String?>>.from(json["MainProducts"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    secondeProducts: List<SecondeProduct>.from(json["SecondeProducts"].map((x) => SecondeProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "MainProducts": List<dynamic>.from(mainProducts.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    "SecondeProducts": List<dynamic>.from(secondeProducts.map((x) => x.toJson())),
  };
}

class SecondeProduct {
  String itemGuide;
  String productName;
  String productModel;
  String productionDate;
  String endDate;

  SecondeProduct({
    required this.itemGuide,
    required this.productName,
    required this.productModel,
    required this.productionDate,
    required this.endDate,
  });

  factory SecondeProduct.fromJson(Map<String, dynamic> json) => SecondeProduct(
    itemGuide: json["ItemGuide"],
    productName: json["ProductName"],
    productModel: json["ProductModel"],
    productionDate: json["ProductionDate"],
    endDate: json["EndDate"],
  );

  Map<String, dynamic> toJson() => {
    "ItemGuide": itemGuide,
    "ProductName": productName,
    "ProductModel": productModel,
    "ProductionDate": productionDate,
    "EndDate": endDate,
  };
}
