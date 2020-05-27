import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../confidentials.dart';
import '../models/home.dart';

class Api {
  static const String apiKey = Confidentials.apikey;
  static const String endpoint =
      'https://api.openweathermap.org/data/2.5/weather';
  var client = http.Client();

  Future getData(String city) async {
    var response = await client.get('$endpoint?q=$city&appid=$apiKey');

    if (response.statusCode == 200) {
      var data = Home.fromJson(map: json.decode(response.body));
      return data;
    }
  }
}
