import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  final int? idWeather;
  const WeatherImage({Key? key, this.idWeather}) : super(key: key);
  final double _heightImage = 250;

  @override
  Widget build(BuildContext context) {
    if (idWeather == 800) {
      return Column(
        children: [
          Image.asset(
            'assets/images/sun.png',
            height: _heightImage,
          ),
        ],
      );
    } else if (idWeather != null && idWeather! >= 200 && idWeather! <= 232) {
      return Column(
        children: [
          Image.asset(
            'assets/images/thunderstorm.png',
            height: _heightImage,
          ),
        ],
      );
      ;
    } else if (idWeather != null && idWeather! >= 801 && idWeather! <= 804) {
      return Column(
        children: [
          Image.asset(
            'assets/images/cloudy.png',
            height: _heightImage,
          ),
        ],
      );
    } else if (idWeather != null && idWeather! >= 500 && idWeather! <= 531) {
      return Column(
        children: [
          Image.asset(
            'assets/images/thunderstorm.png',
            height: _heightImage,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Image.asset(
            'assets/images/sun.png',
            height: _heightImage,
          ),
        ],
      );
    }
  }
}
