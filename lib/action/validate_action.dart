import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:math';

class ValidateDate
{
  static bool userName(String username)
  {
    String pattern = r'^([a-z]{3})([a-z0-9]{5,28}$)';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(username))
    {
      return false;
    }
    else
      return true;
  }

  static bool passWord1(String passWord1)
  {
    String pattern = r'^([a-zA-Z0-9!@#$%^&*()_+=-]{8,31}$)';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(passWord1))
      return false;
    else
      return true;
  }

//  static String passWordV2(String passWord1, String passWord2) {
//    if (passWord1 != passWord2)
//      return 'Password does not match';
//    else
//      return null;
//  }

  static bool email(String email)
  {
    return EmailValidator.validate(email);
  }

  static String encryptString(String value)
  {
    Random random = Random();
    List<int> saltByte = List<int>.generate(32, (_)
    => random.nextInt(256));
    String salt = base64Encode(saltByte);
    List<int> key = utf8.encode(value);
    List<int> bytes = utf8.encode(salt);
    Hmac hmac = Hmac(sha256, key);
    Digest digest = hmac.convert(bytes);
    return digest.toString();
  }
}
