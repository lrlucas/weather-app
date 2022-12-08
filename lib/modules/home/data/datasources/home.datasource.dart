import 'package:dio/dio.dart';
import 'package:weather_app/modules/home/data/models/weather.model.dart';

import '../models/weather_forecast.model.dart';

class HomeDatasource {
  final Dio _dio = Dio();
  final String _url =
      'https://api.openweathermap.org/data/2.5/weather?appid=56ecdda56371cb36dafdde043b8174dd&lang=ES&units=metric';
  final String _url2 =
      'https://api.openweathermap.org/data/2.5/forecast?appid=56ecdda56371cb36dafdde043b8174dd&units=metric';

  Future<WeatherModel> getWeather(String query) async {
    final url = '$_url&q=$query';
    final response = await _dio.get(url);
    return WeatherModel.fromJson(response.data);
  }

  Future<WeatherForecast> getTimeEvery3hours(String query) async {
    final url = '$_url2&q=$query';
    final response = await _dio.get(url);
    return WeatherForecast.fromJson(response.data);
  }
}
