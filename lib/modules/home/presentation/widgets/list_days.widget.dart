import 'package:flutter/material.dart';

import '../model/day_model.dart';

class ListDays extends StatelessWidget {
  ListDays({
    Key? key,
    required this.listday,
  }) : super(key: key);
  List<DayModel> listday;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: listday
              .map(
                (day) => Row(
                  children: [
                    Text(
                      day.nameFormatted ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
