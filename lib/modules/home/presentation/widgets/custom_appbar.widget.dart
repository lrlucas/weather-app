import 'package:flutter/material.dart';
import 'pin_name_location.widget.dart';
import '../../../../core/styles/style.constant.dart';
import '../../../details/presentation/page/detail.dart';

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
            const PinNameLocation(),
            Row(
              children: [
                TextButton(
                  child: const Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 30,
                ),
                TextButton(
                  child: const Icon(
                    Icons.date_range,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
