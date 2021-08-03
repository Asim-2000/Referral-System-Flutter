import 'dart:convert';
import 'package:flutter_tutorials/models/weather-mode.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    final queryParameters = {
      'q': city,
      'appid': env['API_KEY'],
      'units': 'metric'
    };

    final uri = Uri.https(
        "api.openweathermap.org", "data/2.5/weather", queryParameters);

    final response = await http.get(uri);
    print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
