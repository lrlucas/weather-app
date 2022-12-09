import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/day_model.dart';
import '../../../data/models/city.model.dart';
import '../../../data/models/weather.model.dart';
import '../../../data/repositories/home.repository.dart';
import '../../../data/models/weather_forecast.model.dart';

part 'home.state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepositoryImp _homeRepository = HomeRepositoryImp();
  final Map<int, String> positionDay = {
    1: 'Lun',
    2: 'Mar',
    3: 'Mierc',
    4: 'Juev',
    5: 'Vier',
    6: 'Sab',
    7: 'Dom',
  };
  final Map<int, String> positionMounth = {
    1: 'Ene',
    2: 'Feb',
    3: 'Mar',
    4: 'Abri',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Ago',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dic',
  };

  final String defaultCity = 'San francisco';

  HomeCubit() : super(InitState()) {
    getWeather(defaultCity);
    getCities();
  }

  void citySelected(String cityName) {
    getWeather(cityName);
  }

  void getWeather(String query) async {
    try {
      final weatherData = await _homeRepository.getWeather(query);
      _homeRepository
          .getTimeEvery3hours(query)
          .then((value) => emit(DailyWeatherForecast(value)));
      final listDays = getDate3Days();
      emit(WeatherData(weatherData));
      emit(ListDaysButtons(listDays));
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        emit(ShowErrorGetWeather());
      }
    }
  }

  void getCities() async {
    final listCities = await _homeRepository.getCityNames();
    emit(ListCities(listCities));
  }

  List<DayModel> getDate3Days() {
    List<DayModel> _listday = [];
    for (var i = 0; i < 5; i++) {
      var nameDay = '';
      final now = DateTime.now();
      final date = DateTime(now.year, now.month, now.day + i);
      nameDay = i == 0
          ? 'Today, ${date.day} ${positionMounth[date.month]}'
          : '${positionDay[date.weekday]}, ${date.day} ${positionMounth[date.month]}';
      final day = DayModel(nameDay, date);
      _listday.add(day);
    }
    return _listday;
  }
}
