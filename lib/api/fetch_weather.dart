import 'dart:convert';

import 'package:weather/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/weather_data_current.dart';
import 'package:weather/model/weather_data_daily.dart';
import 'package:weather/model/weather_data_hourly.dart';
import 'package:weather/utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  //processing the datafrom response -> to JSON

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));

    return weatherData!;
  }
}
