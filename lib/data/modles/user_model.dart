 class UserModel {
   static const String collectionName = 'Users';

   String? userName;
  String? phoneNumber;
  String? email;
  String? uId;

  UserModel({
    required this.userName,
    required this.phoneNumber,
    required this.email,
    required this.uId,
  });

  UserModel.fromJson(Map<String, dynamic> json) : this(
    userName : json['userName'],
    phoneNumber : json['phoneNumber'],
    email : json['email'],
    uId : json['uId'],

  );

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'phoneNumber': phoneNumber,
      'email': email,
      'uId': uId,
    };
  }
}
