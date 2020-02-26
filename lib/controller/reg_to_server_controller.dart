//import 'package:aqueduct/aqueduct.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:cone05/model/person_model.dart';
import 'package:dio/dio.dart' as fuck;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

abstract class RegServer {
  static void regToServer(Person person) async {
    Map<String, dynamic> jsonObj = person.toJson();
    print(jsonObj);

    String url = 'http://192.168.1.100:8888';
    fuck.RequestOptions option = fuck.RequestOptions();
    option.responseType = fuck.ResponseType.json;
    //option.connectTimeout = 50000;
    option.baseUrl = url;
    option.contentType = fuck.Headers.jsonContentType;
    option.method = 'POST';
    option.data = jsonObj;
    fuck.Dio dio = fuck.Dio();
    fuck.Response response = await dio.request("/reg", options: option);

    if (response.statusCode == 200) {
      print('hi');
      Map<String, dynamic> json2Obj = response.data;
      print(json2Obj);
    } else {
      print(response.statusCode);
    }
  }

  static void regToServer2(Person person) async
  {
    Map<String, dynamic> jsonObj = person.toJson();
    print(jsonObj);

    String url = 'http://192.168.1.100:8888';
    fuck.RequestOptions option = fuck.RequestOptions();
    option.responseType = fuck.ResponseType.json;
    //option.connectTimeout = 50000;
    option.baseUrl = url;
    option.contentType = fuck.Headers.jsonContentType;
    option.method = 'POST';
    option.data = jsonObj;
    fuck.Dio dio = fuck.Dio();
    fuck.Response response = await dio.request("/reg", options: option);

    if (response.statusCode == 200) {
      print('hi');
      Map<String, dynamic> json2Obj = response.data;
      print(json2Obj);
    } else {
      print(response.statusCode);
    }
  }
}
