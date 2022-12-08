import 'package:flutter/material.dart';
import '../widget/appbar_detail.widget.dart';
import '../widget/point_position.widget.dart';
import '../widget/suggestionCard.widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final nextWeek = [
    {
      'titleDay': 'Sunday',
      'max': '28 °',
      'min': '27 °',
      'icon': 'assets/images/partly-cloudy.png',
      'color': Colors.yellow
    },
    {
      'titleDay': 'Monday',
      'max': '27 °',
      'min': '20 °',
      'icon': 'assets/images/partly-cloudy.png',
      'color': Colors.yellow
    },
    {
      'titleDay': 'Tuesday',
      'max': '25 °',
      'min': '18 °',
      'icon': 'assets/images/thunderstorm2.png',
      'color': Colors.blue
    },
    {
      'titleDay': 'Wednesday',
      'max': '28 °',
      'min': '22 °',
      'icon': 'assets/images/day.png',
      'color': Colors.yellow
    },
    {
      'titleDay': 'Thursday',
      'max': '23 °',
      'min': '18 °',
      'icon': 'assets/images/thunderstorm2.png',
      'color': Colors.blueGrey
    },
    {
      'titleDay': 'Friday',
      'max': '23 °',
      'min': '17 °',
      'icon': 'assets/images/thunderstorm2.png',
      'color': Colors.blueGrey
    },
    {
      'titleDay': 'Saturday',
      'max': '29 °',
      'min': '19 °',
      'icon': 'assets/images/partly-cloudy.png',
      'color': Colors.yellow,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff232535),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const AppbarDetail(),
                const SizedBox(
                  height: 80,
                ),
                const SuggestionCard(),
                const SizedBox(
                  height: 20,
                ),
                const PointPosition(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Next week',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: nextWeek.map(
                      (day) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${day['titleDay']}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${day['max']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${day['min']}',
                                      style: const TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  '${day['icon']}',
                                  width: 30,
                                  color: day['color'] as Color,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 40,
              left: MediaQuery.of(context).size.width * 0.65,
              child: Image.asset(
                'assets/images/partly-cloudy.png',
                color: Colors.white,
                width: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
