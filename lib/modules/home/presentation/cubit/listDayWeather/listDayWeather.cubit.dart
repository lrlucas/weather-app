import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/modules/home/presentation/model/day_weather_model.dart';

import '../../../data/repositories/home.repository.dart';

part 'listDayWeather.state.dart';

class ListDayWeatherCubit extends Cubit<ListDayWeatherState> {
  final HomeRepositoryImp _homeRepository = HomeRepositoryImp();

  ListDayWeatherCubit() : super(InitState()) {
    getTimeEvery3hours('Santa Cruz de la Sierra', DateTime.now());
  }

  void getTimeEvery3hours(String query, DateTime? dateTime) async {
    final response = await _homeRepository.getTimeEvery3hours(query);
    final dateTimeWeather = response.list
        .where(
          (element) => element.dtTxt.day == dateTime?.day,
        )
        .toList();
    final dayWeatherModelMap = dateTimeWeather
        .map((e) => DayWeatherModel(
              hour: DateFormat.jm().format(e.dtTxt).toString(),
              temperature: e.main.temp.round().toString(),
              icon: getIcon(e.weather.first.id),
            ))
        .toList();
    emit(DaysWeather(dayWeatherModelMap));
  }

  String getIcon(int idWeather) {
    if (idWeather == 800) {
      return 'day.png';
    } else if (idWeather >= 200 && idWeather <= 232) {
      return 'thunderstorm.png';
    } else if (idWeather >= 801 && idWeather <= 804) {
      return 'cloud-computing.png';
    } else if (idWeather >= 500 && idWeather <= 531) {
      return 'thunderstorm2.png';
    } else {
      return 'day.png';
    }
  }
}
