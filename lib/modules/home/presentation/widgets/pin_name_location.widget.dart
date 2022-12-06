import 'package:flutter/material.dart';
import 'package:weather_app/core/styles/style.constant.dart';

class PinNameLocation extends StatelessWidget {
  const PinNameLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.location_pin),
        SizedBox(
          width: StyleConstans.safeSpaceSmall,
        ),
        Text(
          'San Francisco',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: StyleConstans.safeSpaceSmall,
        ),
        Icon(Icons.arrow_drop_down_sharp),
      ],
    );
  }
}
