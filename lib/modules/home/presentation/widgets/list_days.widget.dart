import 'package:flutter/material.dart';

import '../model/day_model.dart';

class ListDays extends StatelessWidget {
  List<DayModel> listday;
  final Function(DateTime? time) onPressed;

  ListDays({
    Key? key,
    required this.listday,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: listday.map((day) {
              return Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  TextButton(
                    child: Text(
                      day.nameFormatted ?? '',
                      style: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                    onPressed: () {
                      onPressed(day.dateTime);
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
