import 'package:flutter/material.dart';
import 'package:weather_app/core/styles/style.constant.dart';

class PinNameLocation extends StatefulWidget {
  PinNameLocation({Key? key}) : super(key: key);

  @override
  State<PinNameLocation> createState() => _PinNameLocationState();
}

class _PinNameLocationState extends State<PinNameLocation> {
  final listCoundtries = [
    {'name': 'Santa Cruz'},
    {'name': 'La Paz'},
    {'name': 'Beni1'},
    {'name': 'Beni2'},
    {'name': 'Beni3'},
    {'name': 'Beni4'},
    {'name': 'Beni5'},
    {'name': 'Beni6'},
    {'name': 'Beni7'},
    {'name': 'Beni8'},
    {'name': 'Beni9'},
    {'name': 'Beni10'},
    {'name': 'Beni11'},
    {'name': 'Beni12'},
    {'name': 'Beni13'},
    {'name': 'Beni14'},
    {'name': 'Beni15'},
    {'name': 'Beni16'},
    {'name': 'Beni17'},
    {'name': 'Beni18'},
    {'name': 'Beni19'},
    {'name': 'Beni20'},
    {'name': 'Beni21'},
    {'name': 'Beni22'},
    {'name': 'Beni23'},
    {'name': 'Beni24'},
    {'name': 'Beni25'},
    {'name': 'Beni26'},
    {'name': 'Beni27'},
    {'name': 'Beni28'},
    {'name': 'Beni29'},
    {'name': 'Beni30'},
    {'name': 'Beni31'},
    {'name': 'Beni32'},
    {'name': 'Beni33'},
    {'name': 'Beni34'},
    {'name': 'Beni35'},
    {'name': 'Beni36'},
  ];

  // var dropdownValue = listCoundtries.first['name'];
  var _dropdowValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_pin),
        const SizedBox(
          width: StyleConstans.safeSpaceSmall,
        ),
        DropdownButton(
          menuMaxHeight: 400,
          hint: Text('City'),
          value: _dropdowValue,
          onChanged: (val) {
            setState(() {
              _dropdowValue = val;
            });
            print(_dropdowValue);
          },
          items: listCoundtries.map((city) {
            return DropdownMenuItem<String>(
              child: Text(city['name'] ?? ''),
              value: city['name'] ?? '',
            );
          }).toList(),
        ),
      ],
    );
  }
}
