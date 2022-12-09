import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/styles/style.constant.dart';
import 'package:weather_app/modules/home/data/models/city.model.dart';
import 'package:weather_app/modules/home/presentation/cubit/home/home.cubit.dart';

class PinNameLocation extends StatefulWidget {
  final List<CityModel> list;
  PinNameLocation({Key? key, required this.list}) : super(key: key);

  @override
  State<PinNameLocation> createState() => _PinNameLocationState();
}

class _PinNameLocationState extends State<PinNameLocation> {
  var _dropdowValue;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: Row(
        children: [
          const Icon(Icons.location_pin),
          const SizedBox(
            width: StyleConstans.safeSpaceSmall,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            margin: const EdgeInsets.only(left: 8, right: 3, top: 0, bottom: 0),
            child: DropdownButton(
              itemHeight: 65,
              isExpanded: true,
              menuMaxHeight: 400,
              hint: const Text('City'),
              value: _dropdowValue,
              onChanged: (val) {
                setState(() {
                  _dropdowValue = val;
                });
                context.read<HomeCubit>().citySelected(_dropdowValue);
              },
              items: widget.list.map((city) {
                return DropdownMenuItem<String>(
                  child: Text(city.name),
                  value: city.name,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
