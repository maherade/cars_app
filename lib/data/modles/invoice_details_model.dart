/// ProductGuide : "D2B9B04D-33EA-4122-8FF5-010E32FBEE5E"
/// Quantity : "1"
/// Unit : "1"
/// TotalValue : "100"
/// DiscountValue : "0"
/// ExtraValue : "0"

class InvoiceDetailsModel {
  InvoiceDetailsModel({
      String? productGuide, 
      String? quantity, 
      String unit="1",
      String? totalValue,
      String discountValue="0",
      String extraValue="0",})
  {
    _productGuide = productGuide;
    _quantity = quantity;
    _unit = unit;
    _totalValue = totalValue;
    _discountValue = discountValue;
    _extraValue = extraValue;
}

  InvoiceDetailsModel.fromJson(dynamic json) {
    _productGuide = json['ProductGuide'];
    _quantity = json['Quantity'];
    _unit = json['Unit'];
    _totalValue = json['TotalValue'];
    _discountValue = json['DiscountValue'];
    _extraValue = json['ExtraValue'];
  }
  String? _productGuide;
  String? _quantity;
  String? _unit;
  String? _totalValue;
  String? _discountValue;
  String? _extraValue;
InvoiceDetailsModel copyWith({  String? productGuide,
  String? quantity,
  String? unit,
  String? totalValue,
  String? discountValue,
  String? extraValue,
}) => InvoiceDetailsModel(  productGuide: productGuide ?? _productGuide,
  quantity: quantity ?? _quantity,
  unit: unit!,
  totalValue: totalValue ?? _totalValue,
  discountValue: discountValue!,
  extraValue: extraValue!,
);
  String? get productGuide => _productGuide;
  String? get quantity => _quantity;
  String? get unit => _unit;
  String? get totalValue => _totalValue;
  String? get discountValue => _discountValue;
  String? get extraValue => _extraValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ProductGuide'] = _productGuide;
    map['Quantity'] = _quantity;
    map['Unit'] = _unit;
    map['TotalValue'] = _totalValue;
    map['DiscountValue'] = _discountValue;
    map['ExtraValue'] = _extraValue;
    return map;
  }

}