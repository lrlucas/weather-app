part of 'listDayWeather.cubit.dart';

abstract class ListDayWeatherState {}

class InitState extends ListDayWeatherState {}

class DaysWeather extends ListDayWeatherState {
  final List<DayWeatherModel> list;
  DaysWeather(this.list);
}
