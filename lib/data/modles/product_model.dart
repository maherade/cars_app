class ProductModel {
  List<MainProducts>? _mainProducts;
  List<SecondeProducts>? _secondeProducts;

  ProductModel(
      {List<MainProducts>? mainProducts,
        List<SecondeProducts>? secondeProducts}) {
    if (mainProducts != null) {
      this._mainProducts = mainProducts;
    }
    if (secondeProducts != null) {
      this._secondeProducts = secondeProducts;
    }
  }

  List<MainProducts>? get mainProducts => _mainProducts;
  set mainProducts(List<MainProducts>? mainProducts) =>
      _mainProducts = mainProducts;
  List<SecondeProducts>? get secondeProducts => _secondeProducts;
  set secondeProducts(List<SecondeProducts>? secondeProducts) =>
      _secondeProducts = secondeProducts;

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['MainProducts'] != null) {
      _mainProducts = <MainProducts>[];
      json['MainProducts'].forEach((v) {
        _mainProducts!.add(new MainProducts.fromJson(v));
      });
    }
    if (json['SecondeProducts'] != null) {
      _secondeProducts = <SecondeProducts>[];
      json['SecondeProducts'].forEach((v) {
        _secondeProducts!.add(new SecondeProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._mainProducts != null) {
      data['MainProducts'] =
          this._mainProducts!.map((v) => v.toJson()).toList();
    }
    if (this._secondeProducts != null) {
      data['SecondeProducts'] =
          this._secondeProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainProducts {
  String? _productModelGuide;
  String? _factoryGuide;
  String? _cardGuide;
  String? _productName;
  String? _latinName;
  String? _statementName;
  String? _barcode;
  String? _productionDate;
  String? _endDate;
  String? _specification;
  String? _productType;
  String? _factory;
  String? _productModel;
  String? _brand;
  String? _countryOrigin;
  Null? _side;
  Null? _manufacturingspecifications;
  Null? _color;
  Null? _colorTone;
  double? _endUserPrice;
  double? _wholePrice;
  bool? _NewItem;
  bool? _BestSeller;

  MainProducts(
      {String? productModelGuide,
        String? factoryGuide,
        String? cardGuide,
        String? productName,
        String? latinName,
        String? statementName,
        String? barcode,
        String? productionDate,
        String? endDate,
        String? specification,
        String? productType,
        String? factory,
        String? productModel,
        String? brand,
        String? countryOrigin,
        Null? side,
        Null? manufacturingspecifications,
        Null? color,
        Null? colorTone,
        double? endUserPrice,
        double? wholePrice,
        double? NewItem,
        double? BestSeller,
      }) {
    if (productModelGuide != null) {
      this._productModelGuide = productModelGuide;
    }
    if (factoryGuide != null) {
      this._factoryGuide = factoryGuide;
    }
    if (cardGuide != null) {
      this._cardGuide = cardGuide;
    }
    if (productName != null) {
      this._productName = productName;
    }
    if (latinName != null) {
      this._latinName = latinName;
    }
    if (statementName != null) {
      this._statementName = statementName;
    }
    if (barcode != null) {
      this._barcode = barcode;
    }
    if (productionDate != null) {
      this._productionDate = productionDate;
    }
    if (endDate != null) {
      this._endDate = endDate;
    }
    if (specification != null) {
      this._specification = specification;
    }
    if (productType != null) {
      this._productType = productType;
    }
    if (factory != null) {
      this._factory = factory;
    }
    if (productModel != null) {
      this._productModel = productModel;
    }
    if (brand != null) {
      this._brand = brand;
    }
    if (countryOrigin != null) {
      this._countryOrigin = countryOrigin;
    }
    if (side != null) {
      this._side = side;
    }
    if (manufacturingspecifications != null) {
      this._manufacturingspecifications = manufacturingspecifications;
    }
    if (color != null) {
      this._color = color;
    }
    if (colorTone != null) {
      this._colorTone = colorTone;
    }
    if (endUserPrice != null) {
      this._endUserPrice = endUserPrice;
    }
    if (wholePrice != null) {
      this._wholePrice = wholePrice;
    }
    if (NewItem != null) {
      this._NewItem = NewItem as bool?;
    }
    if (BestSeller != null) {
      this._BestSeller = BestSeller as bool?;
    }
  }

  String? get productModelGuide => _productModelGuide;
  set productModelGuide(String? productModelGuide) =>
      _productModelGuide = productModelGuide;
  String? get factoryGuide => _factoryGuide;
  set factoryGuide(String? factoryGuide) => _factoryGuide = factoryGuide;
  String? get cardGuide => _cardGuide;
  set cardGuide(String? cardGuide) => _cardGuide = cardGuide;
  String? get productName => _productName;
  set productName(String? productName) => _productName = productName;
  String? get latinName => _latinName;
  set latinName(String? latinName) => _latinName = latinName;
  String? get statementName => _statementName;
  set statementName(String? statementName) => _statementName = statementName;
  String? get barcode => _barcode;
  set barcode(String? barcode) => _barcode = barcode;
  String? get productionDate => _productionDate;
  set productionDate(String? productionDate) =>
      _productionDate = productionDate;
  String? get endDate => _endDate;
  set endDate(String? endDate) => _endDate = endDate;
  String? get specification => _specification;
  set specification(String? specification) => _specification = specification;
  String? get productType => _productType;
  set productType(String? productType) => _productType = productType;
  String? get factory => _factory;
  set factory(String? factory) => _factory = factory;
  String? get productModel => _productModel;
  set productModel(String? productModel) => _productModel = productModel;
  String? get brand => _brand;
  set brand(String? brand) => _brand = brand;
  String? get countryOrigin => _countryOrigin;
  set countryOrigin(String? countryOrigin) => _countryOrigin = countryOrigin;
  Null? get side => _side;
  set side(Null? side) => _side = side;
  Null? get manufacturingspecifications => _manufacturingspecifications;
  set manufacturingspecifications(Null? manufacturingspecifications) =>
      _manufacturingspecifications = manufacturingspecifications;
  Null? get color => _color;
  set color(Null? color) => _color = color;
  Null? get colorTone => _colorTone;
  set colorTone(Null? colorTone) => _colorTone = colorTone;
  double? get endUserPrice => _endUserPrice;
  set endUserPrice(double? endUserPrice) => _endUserPrice = endUserPrice;

  double? get wholePrice => _wholePrice;
  set wholePrice(double? wholePrice) => _wholePrice = wholePrice;
  bool? get NewItem => _NewItem;
  set NewItem(bool? NewItem) => _NewItem = NewItem;
  bool? get BestSeller => _BestSeller;
  set BestSeller(bool? BestSeller) => _BestSeller = BestSeller;

  MainProducts.fromJson(Map<String, dynamic> json) {
    _productModelGuide = json['productModelGuide'];
    _factoryGuide = json['factoryGuide'];
    _cardGuide = json['CardGuide'];
    _productName = json['ProductName'];
    _latinName = json['LatinName'];
    _statementName = json['StatementName'];
    _barcode = json['Barcode'];
    _productionDate = json['ProductionDate'];
    _endDate = json['EndDate'];
    _specification = json['Specification'];
    _productType = json['ProductType'];
    _factory = json['Factory'];
    _productModel = json['ProductModel'];
    _brand = json['Brand'];
    _countryOrigin = json['CountryOrigin'];
    _side = json['Side'];
    _manufacturingspecifications = json['Manufacturingspecifications'];
    _color = json['Color'];
    _colorTone = json['ColorTone'];
    _endUserPrice = json['EndUserPrice'];
    _wholePrice = json['WholePrice'];
    _BestSeller = json['BestSeller'];
    _NewItem = json['NewItem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productModelGuide'] = this._productModelGuide;
    data['factoryGuide'] = this._factoryGuide;
    data['CardGuide'] = this._cardGuide;
    data['ProductName'] = this._productName;
    data['LatinName'] = this._latinName;
    data['StatementName'] = this._statementName;
    data['Barcode'] = this._barcode;
    data['ProductionDate'] = this._productionDate;
    data['EndDate'] = this._endDate;
    data['Specification'] = this._specification;
    data['ProductType'] = this._productType;
    data['Factory'] = this._factory;
    data['ProductModel'] = this._productModel;
    data['Brand'] = this._brand;
    data['CountryOrigin'] = this._countryOrigin;
    data['Side'] = this._side;
    data['Manufacturingspecifications'] = this._manufacturingspecifications;
    data['Color'] = this._color;
    data['ColorTone'] = this._colorTone;
    data['EndUserPrice'] = this._endUserPrice;
    data['WholePrice'] = this._wholePrice;
    data['NewItem'] = this._NewItem;
    data['BestSeller'] = this._BestSeller;
    return data;
  }
}

class SecondeProducts {
  String? _itemGuide;
  String? _productName;
  String? _productModel;
  String? _productionDate;
  String? _endDate;

  SecondeProducts(
      {String? itemGuide,
        String? productName,
        String? productModel,
        String? productionDate,
        String? endDate}) {
    if (itemGuide != null) {
      this._itemGuide = itemGuide;
    }
    if (productName != null) {
      this._productName = productName;
    }
    if (productModel != null) {
      this._productModel = productModel;
    }
    if (productionDate != null) {
      this._productionDate = productionDate;
    }
    if (endDate != null) {
      this._endDate = endDate;
    }
  }

  String? get itemGuide => _itemGuide;
  set itemGuide(String? itemGuide) => _itemGuide = itemGuide;
  String? get productName => _productName;
  set productName(String? productName) => _productName = productName;
  String? get productModel => _productModel;
  set productModel(String? productModel) => _productModel = productModel;
  String? get productionDate => _productionDate;
  set productionDate(String? productionDate) =>
      _productionDate = productionDate;
  String? get endDate => _endDate;
  set endDate(String? endDate) => _endDate = endDate;

  SecondeProducts.fromJson(Map<String, dynamic> json) {
    _itemGuide = json['ItemGuide'];
    _productName = json['ProductName'];
    _productModel = json['ProductModel'];
    _productionDate = json['ProductionDate'];
    _endDate = json['EndDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemGuide'] = this._itemGuide;
    data['ProductName'] = this._productName;
    data['ProductModel'] = this._productModel;
    data['ProductionDate'] = this._productionDate;
    data['EndDate'] = this._endDate;
    return data;
  }
}