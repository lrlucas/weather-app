import 'package:flutter/material.dart';
import 'pin_name_location.widget.dart';
import '../../../../core/styles/style.constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: StyleConstans.safeSpaceMedium,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PinNameLocation(),
            Icon(Icons.calendar_month_outlined),
          ],
        ),
      ),
    );
  }
}
