import 'package:weather_app/modules/home/data/models/weather.model.dart';

import '../../data/models/weather_forecast.model.dart';

abstract class HomeRepository {
  Future<WeatherModel> getWeather(String query);
  Future<WeatherForecast> getTimeEvery3hours(String query);
}
