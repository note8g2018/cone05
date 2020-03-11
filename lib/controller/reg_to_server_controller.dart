import 'dart:convert';
import 'package:cone05/model/person_model.dart';
import 'package:dio/dio.dart' as fuck;
import 'package:steel_crypt/PointyCastleN/asymmetric/api.dart';
import 'package:steel_crypt/steel_crypt.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

abstract class RegServer
{
  static void regToServer({Person person})
  async {
    String url = 'http://192.168.1.100:8888';
    fuck.RequestOptions option = fuck.RequestOptions();
    option.responseType = fuck.ResponseType.json;
    //option.connectTimeout = 50000;
    option.baseUrl = url;
    option.contentType = fuck.Headers.jsonContentType;
    option.method = 'POST';
    option.data = person.sendPublicKey();
    fuck.Dio dio = fuck.Dio();
    fuck.Response response = await dio.request("/reg", options: option);
    if (response.statusCode == 200)
    {
      final Map<String, dynamic> dataJson = response.data;
      print(dataJson);
    }
    else
    {
      print(response.statusCode);
    }
  }

  static void regToServer2({Person person})
  async
  {
    String ws = 'ws://192.168.1.100:8888/regw';
    final IOWebSocketChannel channel = IOWebSocketChannel.connect(ws);
    channel.sink.add(person.sendPublicKey());
    channel.stream.listen(
        (data)
        {
          final Map<String, dynamic> dataJson = jsonDecode(data);
          final String method = dataJson["method"] as String;
          switch(method)
          {
            case 'sendData':
              handleSendData(dataJson, channel, person);
              break;
          }
        }
    );
  }

  static void handleSendData(Map<String, dynamic> dataJson, IOWebSocketChannel channel, Person person)
  {
    final RSAPublicKey serverPublicKey = RsaCrypt().parseKeyFromString(dataJson["serverPublicKey"]);
    final String personS = jsonEncode(person);
    final String data2 = RsaCrypt().encrypt(personS, serverPublicKey);
    final Map<String, dynamic> dataJsonServer =
    {
      "method": "reg",
      "data": data2,
    };
    channel.sink.add(jsonEncode(dataJsonServer));
  }
}
