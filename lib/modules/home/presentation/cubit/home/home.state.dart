part of 'home.cubit.dart';

abstract class HomeState {}

class InitState extends HomeState {}

class Loading extends HomeState {}

class WeatherData extends HomeState {
  final WeatherModel weatherModel;
  WeatherData(this.weatherModel);
}

class ListDaysButtons extends HomeState {
  final List<DayModel> list;

  ListDaysButtons(this.list);
}

class DailyWeatherForecast extends HomeState {
  final WeatherForecast weatherForecast;
  DailyWeatherForecast(this.weatherForecast);
}
