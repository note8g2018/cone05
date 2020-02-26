import 'package:mongo_dart/mongo_dart.dart';
import 'package:meta/meta.dart';

class Person
{
  Person({
    this.id,
    @required this.userName,
    @required this.email,
    this.passWord,
  });

  ObjectId id;
  final String userName;
  final String email;
  String passWord;

  Map<String, dynamic> toJson()
  {
    return {
      "_id": id,
      "userName": userName,
      "email": email,
      "passWord": passWord,
    };
  }

  Person.fromJson(Map<String, dynamic> jsonObj)
      : this(
    id: jsonObj["_id"] as ObjectId,
    userName: jsonObj["userName"] as String,
    email: jsonObj["email"] as String,
    //passWord: jsonObj["passWord"],
  );
}
