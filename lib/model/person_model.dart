import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:meta/meta.dart';
import 'package:steel_crypt/PointyCastleN/asymmetric/api.dart';
import 'package:steel_crypt/steel_crypt.dart';

class Person
{
  Person({
    @required this.userName,
    @required this.email,
    this.id,
    this.passWord,
    this.isLogin = false,
    this.result,
    this.publicKey,
    this.privateKey,
  });

  factory Person.fromJson(dynamic jsonObj)
  {
    return Person(
      id: jsonObj["_id"] as ObjectId,
      userName: jsonObj["userName"] as String,
      email: jsonObj["email"] as String,
      isLogin: jsonObj["isLogin"] as bool,
      passWord: jsonObj["passWord"] as String,
//      userNameList: (jsonObj["userNameList"] as Iterable).map((v)=> v.toString()).toList(),
//      passWordList: (jsonObj["passWordList"] as Iterable).map((v)=> v.toString()).toList(),
      result: jsonObj["result"] as bool,
      publicKey: RsaCrypt().parseKeyFromString(jsonObj["publicKey"] as String) as RSAPublicKey,
    );
  }

  final ObjectId id;
  final String userName;
  final String email;
  String passWord;
  bool isLogin;
  bool result;
  RSAPublicKey publicKey;
  RSAPrivateKey privateKey;

  Map<String, dynamic> toJson()
  {
    return {
      "_id": id,
      "userName": userName,
      "email": email,
      "passWord": passWord,
//      "userNameList": userNameList,
//      "passWordList": passWordList,
      "isLogin": isLogin,
      "result": result,
//      "publicKey": RsaCrypt().encodeKeyToString(publicKey),
    };
  }

  String sendPublicKey()
  {
    final RsaCrypt rsaCrypt = RsaCrypt();
    publicKey = rsaCrypt.randPubKey;
    privateKey = rsaCrypt.randPrivKey;
    final String clientPublicKey = rsaCrypt.encodeKeyToString(publicKey);
//    final String clientPrivateKey = rsaCrypt.encodeKeyToString(privateKey);
    final Map<String, dynamic> dataJson =
        {
          "method": "key",
          "clientPublicKey": clientPublicKey,
        };
    return jsonEncode(dataJson);
  }

}
