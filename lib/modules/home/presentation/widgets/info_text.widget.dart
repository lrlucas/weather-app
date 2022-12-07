import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final double? temp;
  final double? windSpeed;
  final int? humidity;
  final String? weatherMain;

  const InfoText({
    Key? key,
    required this.temp,
    required this.windSpeed,
    required this.humidity,
    required this.weatherMain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weatherMain ?? 'error',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          '${temp?.round() ?? ''} °',
          style: const TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/wind-icon.png',
              width: 15,
            ),
            const SizedBox(
              width: 8,
            ),
            Text('${windSpeed?.round() ?? 0} km/h'),
            const SizedBox(
              width: 18,
            ),
            Image.asset(
              'assets/images/blood-drop-icon.png',
              width: 15,
            ),
            const SizedBox(
              width: 8,
            ),
            Text('${humidity ?? 0} %'),
          ],
        )
      ],
    );
  }
}
