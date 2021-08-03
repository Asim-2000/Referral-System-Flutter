class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];

    return WeatherInfo(description: description, icon: icon);
  }
}

class TempInfo {
  final double temp;

  TempInfo({this.temp});

  factory TempInfo.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    return TempInfo(temp: temp);
  }
}

class WeatherResponse {
  final String cityName;
  final int code;
  final TempInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({this.cityName, this.tempInfo, this.weatherInfo, this.code});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final code = json['cod'];
    if (code == 200) {
      final cityName = json['name'];
      final tempInfoJson = json['main'];
      final tempInfo = TempInfo.fromJson(tempInfoJson);

      final weatherInfoJson = json['weather'][0];
      final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

      return WeatherResponse(
          cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
    }
    return null;
  }
}
