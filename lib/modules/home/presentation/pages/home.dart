import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/day_model.dart';
import '../cubit/home/home.cubit.dart';
import '../model/day_weather_model.dart';
import '../widgets/info_text.widget.dart';
import '../widgets/list_days.widget.dart';
import '../../data/models/weather.model.dart';
import '../widgets/custom_appbar.widget.dart';
import '../widgets/weather_image.widget.dart';
import '../widgets/list_day_weather.widget.dart';
import '../../../../core/styles/style.constant.dart';
import '../../data/models/weather_forecast.model.dart';
import '../cubit/listDayWeather/listDayWeather.cubit.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? _weatherModel;
  List<DayModel> listday = [];
  List<DayWeatherModel> daysWeather = [];
  WeatherForecast? _weatherForecast;

  ListDayWeatherCubit listDayWeatherCubit = ListDayWeatherCubit();

  Color? _getColorBackground(int? idWeather) {
    if (idWeather == 800) {
      return StyleConstans.sunnyColor;
    } else if (idWeather != null && idWeather >= 200 && idWeather <= 232) {
      return StyleConstans.rainyColor;
    } else if (idWeather != null && idWeather >= 801 && idWeather <= 804) {
      return StyleConstans.cloudyColor;
    } else if (idWeather != null && idWeather >= 500 && idWeather <= 531) {
      return StyleConstans.rainyColor;
    } else {
      return StyleConstans.sunnyColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<ListDayWeatherCubit>(
          create: (context) => listDayWeatherCubit,
        ),
      ],
      child: BlocListener<ListDayWeatherCubit, ListDayWeatherState>(
        listener: (context, state) {
          if (state is DaysWeather) {
            setState(() {
              daysWeather = state.list;
            });
          }
        },
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is WeatherData) {
              setState(() {
                _weatherModel = state.weatherModel;
              });
            } else if (state is ListDaysButtons) {
              setState(() {
                listday = state.list;
              });
            } else if (state is DailyWeatherForecast) {
              setState(() {
                _weatherForecast = state.weatherForecast;
                listDayWeatherCubit.getTimeEvery3hours2(
                  state.weatherForecast,
                  DateTime.now(),
                );
              });
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }

            /// TODO: agregar un pull to refresh
            return Scaffold(
              backgroundColor: _getColorBackground(
                _weatherModel?.weather.first.id,
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomAppBar(),
                      const SizedBox(
                        height: 40,
                      ),
                      WeatherImage(
                        idWeather: _weatherModel?.weather.first.id,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      InfoText(
                        temp: _weatherModel?.main.temp,
                        windSpeed: _weatherModel?.wind.speed,
                        humidity: _weatherModel?.main.humidity,
                        weatherMain: _weatherModel?.weather.first.main,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ListDays(
                        listday: listday,
                        onPressed: (DateTime? time) {
                          listDayWeatherCubit.getTimeEvery3hours2(
                            _weatherForecast,
                            time,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      ListDayWeather(
                        daysWeather: daysWeather,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
