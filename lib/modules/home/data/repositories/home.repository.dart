import 'package:weather_app/modules/home/data/datasources/home.datasource.dart';
import 'package:weather_app/modules/home/data/models/weather.model.dart';
import 'package:weather_app/modules/home/data/models/weather_forecast.model.dart';
import 'package:weather_app/modules/home/domain/repositories/home.repository.dart';

import '../models/city.model.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeDatasource _homeDatasource = HomeDatasource();

  @override
  Future<WeatherModel> getWeather(String query) {
    return _homeDatasource.getWeather(query);
  }

  @override
  Future<WeatherForecast> getTimeEvery3hours(String query) async {
    return await _homeDatasource.getTimeEvery3hours(query);
  }

  @override
  Future<List<CityModel>> getCityNames() async {
    return await _homeDatasource.getCityNames();
  }
}
