/// agentGuide : "c8d91879-b78d-4969-b4d8-039cc86971ea"
/// agentName : "JANE"
/// latinName : ""
/// userLanguage : 1
/// phone : ""
/// email : ""
/// fulladress : ""
/// myToken : "7QP4688NC9BG00YN3GI5GLQITLJQFD"

class TokenModel {
  TokenModel({
      String? agentGuide, 
      String? agentName, 
      String? latinName, 
      num? userLanguage, 
      String? phone, 
      String? email, 
      String? fulladress, 
      String? myToken,
  })
  {
    _agentGuide = agentGuide;
    _agentName = agentName;
    _latinName = latinName;
    _userLanguage = userLanguage;
    _phone = phone;
    _email = email;
    _fulladress = fulladress;
    _myToken = myToken;
}

  TokenModel.fromJson(dynamic json) {
    _agentGuide = json['agentGuide'];
    _agentName = json['agentName'];
    _latinName = json['latinName'];
    _userLanguage = json['userLanguage'];
    _phone = json['phone'];
    _email = json['email'];
    _fulladress = json['fulladress'];
    _myToken = json['myToken'];
  }
  String? _agentGuide;
  String? _agentName;
  String? _latinName;
  num? _userLanguage;
  String? _phone;
  String? _email;
  String? _fulladress;
  String? _myToken;
TokenModel copyWith({  String? agentGuide,
  String? agentName,
  String? latinName,
  num? userLanguage,
  String? phone,
  String? email,
  String? fulladress,
  String? myToken,
}) => TokenModel(  agentGuide: agentGuide ?? _agentGuide,
  agentName: agentName ?? _agentName,
  latinName: latinName ?? _latinName,
  userLanguage: userLanguage ?? _userLanguage,
  phone: phone ?? _phone,
  email: email ?? _email,
  fulladress: fulladress ?? _fulladress,
  myToken: myToken ?? _myToken,
);
  String? get agentGuide => _agentGuide;
  String? get agentName => _agentName;
  String? get latinName => _latinName;
  num? get userLanguage => _userLanguage;
  String? get phone => _phone;
  String? get email => _email;
  String? get fulladress => _fulladress;
  String? get myToken => _myToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['agentGuide'] = _agentGuide;
    map['agentName'] = _agentName;
    map['latinName'] = _latinName;
    map['userLanguage'] = _userLanguage;
    map['phone'] = _phone;
    map['email'] = _email;
    map['fulladress'] = _fulladress;
    map['myToken'] = _myToken;
    return map;
  }

}