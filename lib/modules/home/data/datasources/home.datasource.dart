import 'package:dio/dio.dart';
import 'package:weather_app/modules/home/data/models/city.model.dart';
import 'package:weather_app/modules/home/data/models/weather.model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/weather_forecast.model.dart';

class HomeDatasource {
  final apiKey = dotenv.env['APIKEY'];
  final _urlWeather = dotenv.env['URLWEATHER'];
  final _urlForecast = dotenv.env['URLFORECAST'];
  final _urlCountries = dotenv.env['URLCOUNTRIES'];
  final Dio _dio = Dio();

  Future<WeatherModel> getWeather(String query) async {
    final url = '$_urlWeather&q=$query';
    final response = await _dio.get(url);
    return WeatherModel.fromJson(response.data);
  }

  Future<WeatherForecast> getTimeEvery3hours(String query) async {
    final url = '$_urlForecast&q=$query';
    final response = await _dio.get(url);
    return WeatherForecast.fromJson(response.data);
  }

  Future<List<CityModel>> getCityNames() async {
    final response = await _dio.get(_urlCountries ?? '');
    final List<dynamic> listData = response.data;
    return listData
        .map(
          (city) => CityModel(name: city['name']),
        )
        .toList();
  }
}
