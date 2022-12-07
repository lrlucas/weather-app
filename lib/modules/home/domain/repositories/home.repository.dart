import 'package:weather_app/modules/home/data/models/weather.model.dart';

abstract class HomeRepository {
  Future<WeatherModel> getWeather(String query);
}
