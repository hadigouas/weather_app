import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class Weatherdata {
  Future<Weather> getdata(String cityname) async {
    print(cityname);
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?appid=d0905f0e6dd9d41a1bd555e86021a6f8&q=$cityname&units=metric'));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
