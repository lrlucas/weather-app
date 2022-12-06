import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Cloudy',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Text(
          '28 °',
          style: TextStyle(
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
            const Text('8 km/h'),
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
            const Text('47 %'),
          ],
        )
      ],
    );
  }
}
