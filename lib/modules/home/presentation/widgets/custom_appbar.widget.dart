import 'package:flutter/material.dart';
import 'package:weather_app/modules/home/data/models/city.model.dart';
import 'pin_name_location.widget.dart';
import '../../../../core/styles/style.constant.dart';
import '../../../details/presentation/page/detail.dart';

class CustomAppBar extends StatelessWidget {
  final List<CityModel> list;
  const CustomAppBar({
    Key? key,
    required this.list,
  }) : super(key: key);

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
            PinNameLocation(
              list: list,
            ),
            Row(
              children: [
                TextButton(
                  child: const Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
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
