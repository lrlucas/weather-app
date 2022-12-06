import 'package:flutter/material.dart';
import 'widgets/info_text.widget.dart';
import 'widgets/list_days.widget.dart';
import 'widgets/custom_appbar.widget.dart';
import 'widgets/list_day_weather.widget.dart';
import '../../../core/styles/style.constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstans.cloudyColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/cloudy.png',
                    height: 300,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            InfoText(),
            const SizedBox(
              height: 24,
            ),
            ListDays(),
            const SizedBox(
              height: 12,
            ),
            ListDayWeather(),
          ],
        ),
      ),
    );
  }
}
