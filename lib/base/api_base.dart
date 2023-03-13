import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:policard_mobile/const/constant.dart';

class SharedData {
  static dynamic responseJson;
}

class ApiBase {
  var responseJson;

  var headersList = {
    'Accept': '*/*',
    'Content-Type': 'application/json; charset=UTF-8',
    'connection': 'keep-alive',
    'Accept-Encoding': 'gzip, deflate, br',
  };
  Future<dynamic> postLogin(String url, dynamic body) async {
    final response = await http.post(
      Uri.parse(apiUrl + url),
      headers: headersList,
      body: json.encode(body),
    );

    responseJson = _returnResponse(response);
    // Comprobamos si la respuesta es un error o no.
    if (responseJson is String) {
      return responseJson;
    }
    // Si no es un error, guardamos el token de acceso en SharedData.responseJson
    SharedData.responseJson = responseJson["accessToken"];
    return responseJson["accessToken"];
  }

  Future<dynamic> getData(String url, String accessToken) async {
    headersList.addAll({'x-access-token': accessToken});
    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(apiUrl + url),
        headers: headersList,
      );
      responseJson = _returnResponse(response);
      if (kDebugMode) {
        print(responseJson);
      }
      return responseJson;
    } catch (e) {
      print(e.toString());
      // Si la excepción es debido a una falta de autenticación, devolvemos un mensaje de error.
      if (e is http.ClientException && e.toString().contains('401')) {
        return {'error': 'No autorizado'};
      }
      // Si la excepción es debido a un recurso no encontrado, devolvemos un mensaje de error
      else if (e is http.ClientException && e.toString().contains('404')) {
        return {'error': 'No encontrado'};
      }
      // De lo contrario, propaga la excepción.
      else {
        rethrow;
      }
    }
  }
}

_returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = jsonDecode(response.body.toString());
      return responseJson;
    case 400:
      var reponseError = jsonDecode(response.body.toString());
      return reponseError["message"];
    case 401:
      var reponseError = jsonDecode(response.body.toString());
      return reponseError["message"];
    case 404:
      var reponseError = jsonDecode(response.body.toString());
      return reponseError["message"];
    default:
      return Exception('default Error: ${response.statusCode.toString()}');
  }
}
