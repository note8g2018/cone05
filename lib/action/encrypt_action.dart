import 'dart:convert';
import 'package:steel_crypt/steel_crypt.dart';
import 'package:steel_crypt/PointyCastleN/asymmetric/api.dart';
import 'package:steel_crypt/PointyCastleN/export.dart';
import 'package:cone05/action/file_action.dart';

class EncryptAction
{
  static String makeEncryptKey()
  {
    final RsaCrypt rsaCrypt = RsaCrypt();
    final publicKey = rsaCrypt.randPubKey;
    final privateKey = rsaCrypt.randPrivKey;
    final String clientPublicKey = rsaCrypt.encodeKeyToString(publicKey);
    final String clientPrivateKey = rsaCrypt.encodeKeyToString(publicKey);

    final Map<String, dynamic> dataJson =
    {
      "method": "key",
      "publicKeyModulus": publicKey.modulus.toString(),
      "publicKeyExponent": publicKey.exponent.toString(),
      "privateKeyModulus": privateKey.modulus.toString(),
      "privateKeyExponent": privateKey.exponent.toString(),
      "privateKeyP": privateKey.p.toString(),
      "privateKeyQ": privateKey.q.toString(),
    };
    final String dataJsonString = jsonEncode(dataJson);
    FileAction.writeToFile(dataJson: dataJsonString, fileName: 'keys.json');
    //FileAction.saveJsonFile(dataJson: dataJsonString, fileName: 'keys.json');
    return publicKey.toString();
  }

  static String encryptString({String unEncryptedString, RSAPublicKey publicKey})
  {
    final RsaCrypt rsaCrypt = RsaCrypt();
    final String encryptedString = rsaCrypt.encrypt(unEncryptedString, publicKey);
    return encryptedString;
  }

  static String decryptString({String encryptedString, RSAPrivateKey privateKey})
  {
    final RsaCrypt rsaCrypt = RsaCrypt();
    final String decryptedString = rsaCrypt.decrypt(encryptedString, privateKey);
    return decryptedString;
  }

  static Future<String> sendPublicKey() async
  {
    final String file = await FileAction.readFromFile(fileName: 'keys.json');
    String publicKey;
    if(file != null)
    {
      return file;
    }
    else
    {
      publicKey = makeEncryptKey();
    }
  }

}