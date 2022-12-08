import 'package:flutter/material.dart';

class PointPosition extends StatelessWidget {
  const PointPosition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          '●',
          style: TextStyle(
            color: Colors.white,
            fontSize: 8,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '●',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 8,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '●',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 8,
          ),
        ),
      ],
    );
  }
}
