import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/home/data/models/weather.model.dart';
import 'package:weather_app/modules/home/presentation/model/day_model.dart';

import '../../../data/repositories/home.repository.dart';

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

  HomeCubit() : super(InitState()) {
    getWeather('Santa Cruz de la Sierra');
    // getWeather('San francisco');
  }

  void getWeather(String query) async {
    emit(Loading());
    final resp = await _homeRepository.getWeather(query);
    final listDays = getDate3Days();
    emit(WeatherData(resp));
    emit(ListDaysButtons(listDays));
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
