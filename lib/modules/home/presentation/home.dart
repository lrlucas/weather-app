import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/weather.model.dart';
import '../../../core/styles/style.constant.dart';
import 'cubit/home.cubit.dart';
import 'model/day_model.dart';
import 'widgets/info_text.widget.dart';
import 'widgets/list_days.widget.dart';
import 'widgets/weather_image.widget.dart';
import 'widgets/custom_appbar.widget.dart';
import 'widgets/list_day_weather.widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? _weatherModel;
  List<DayModel> listday = [];

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
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
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
          return Scaffold(
            backgroundColor: _getColorBackground(
              _weatherModel?.weather.first.id,
            ),
            body: SafeArea(
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
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ListDayWeather(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
