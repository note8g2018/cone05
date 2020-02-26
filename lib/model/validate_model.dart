import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:math';

class ValiDate {
  static String userNameV(String username) {
    String pattern = r'^([a-z]{3})([a-z0-9]{5,28}$)';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(username)) {
      return 'Enter Valid User Name';
    } else
      return null;
  }

  static String passWordV1(String passWord1) {
    String pattern = r'^([a-zA-Z0-9!@#$%^&*()_+=-]{8,31}$)';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(passWord1))
      return 'Enter Valid PassWord';
    else
      return null;
  }

//  static String passWordV2(String passWord1, String passWord2) {
//    if (passWord1 != passWord2)
//      return 'Password does not match';
//    else
//      return null;
//  }

  static String emailV(String email) {
    final bool isValid = EmailValidator.validate(email);
    if (!isValid)
      return 'Enter Valid E-Mail';
    else
      return null;
  }

  static String encrptPassword(String password) {
    Random random = Random();
    List<int> saltByte = List<int>.generate(32, (_) => random.nextInt(256));
    String salt = base64Encode(saltByte);
    List<int> key = utf8.encode(password);
    List<int> bytes = utf8.encode(salt);
    Hmac hmac = Hmac(sha256, key);
    Digest digest = hmac.convert(bytes);
    return digest.toString();
  }
}
