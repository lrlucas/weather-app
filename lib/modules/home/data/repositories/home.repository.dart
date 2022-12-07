import 'package:weather_app/modules/home/data/datasources/home.datasource.dart';
import 'package:weather_app/modules/home/data/models/weather.model.dart';
import 'package:weather_app/modules/home/domain/repositories/home.repository.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeDatasource _homeDatasource = HomeDatasource();

  @override
  Future<WeatherModel> getWeather(String query) {
    return _homeDatasource.getWeather(query);
  }
}
