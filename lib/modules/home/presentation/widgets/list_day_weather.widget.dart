import 'package:flutter/material.dart';

class ListDayWeather extends StatelessWidget {
  const ListDayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
            ],
          ),
        ),
      ],
    );
  }
}
