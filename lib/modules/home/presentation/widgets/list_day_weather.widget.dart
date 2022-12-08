import 'package:flutter/material.dart';
import '../model/day_weather_model.dart';

class ListDayWeather extends StatefulWidget {
  List<DayWeatherModel> daysWeather = [];

  ListDayWeather({
    Key? key,
    required this.daysWeather,
  }) : super(key: key);

  @override
  State<ListDayWeather> createState() => _ListDayWeatherState();
}

class _ListDayWeatherState extends State<ListDayWeather> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.daysWeather.isEmpty
            ? const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Center(
                  child: Text(
                    'No hay datos disponibles para el dia de hoy',
                  ),
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widget.daysWeather.map((day) {
                      return Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 115,
                            height: 160,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  day.hour ?? '',
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/${day.icon}',
                                  color: Colors.white,
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  '${day.temperature ?? ''} °',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                        ],
                      );
                    }).toList()),
              ),
      ],
    );
  }
}






/*


const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 115,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            '09:00 AM',
                            style: TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                          Image.asset(
                            'assets/images/partly-cloudy.png',
                            color: Colors.white,
                            height: 60,
                            width: 60,
                          ),
                          const Text(
                            '28 °',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),

















 */