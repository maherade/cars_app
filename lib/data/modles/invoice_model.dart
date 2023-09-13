/// ErrorMsg : ""
/// RowsEffected : "12"

class InvoiceModel {
  InvoiceModel({
      String? errorMsg, 
      String? rowsEffected,}){
    _errorMsg = errorMsg;
    _rowsEffected = rowsEffected;
}

  InvoiceModel.fromJson(dynamic json) {
    _errorMsg = json['ErrorMsg'];
    _rowsEffected = json['RowsEffected'];
  }
  String? _errorMsg;
  String? _rowsEffected;
InvoiceModel copyWith({  String? errorMsg,
  String? rowsEffected,
}) => InvoiceModel(  errorMsg: errorMsg ?? _errorMsg,
  rowsEffected: rowsEffected ?? _rowsEffected,
);
  String? get errorMsg => _errorMsg;
  String? get rowsEffected => _rowsEffected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ErrorMsg'] = _errorMsg;
    map['RowsEffected'] = _rowsEffected;
    return map;
  }

}