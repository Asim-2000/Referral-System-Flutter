import 'package:flutter_tutorials/services/data-service.dart';
import 'package:flutter_tutorials/models/weather-mode.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String referrarCode;
  static const String routeName = '/signUp';

  const HomeScreen({Key key, this.referrarCode}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
  WeatherResponse _response;

  // get referrarCode => this.referrarCode;

  @override
  Widget build(BuildContext context) {
    void _search() async {
      final response = await _dataService.getWeather(_cityTextController.text);
      setState(() => _response = response);
    }

    var referrarCode = widget.referrarCode;
    if (referrarCode != null) {
      _cityTextController.text = referrarCode ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WeatherX",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Image.network(_response.iconUrl),
                    Text(
                      '${_response.tempInfo.temp}°C',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(_response.weatherInfo.description)
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter City", labelText: "City Name"),
                    controller: _cityTextController,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(onPressed: _search, child: Text("Search"))
            ],
          ),
        ),
      ),
      // drawer: MyDrawer(),
    );
  }
}
