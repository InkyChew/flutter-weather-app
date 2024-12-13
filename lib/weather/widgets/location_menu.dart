import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/weather.dart';

class LocationMenu extends StatelessWidget {
  static Map<String, String> locations = {
    'Yilan': '宜蘭',
    'Taipei': '台北',
    'New Taipei': '新北',
    'Keelung': '基隆',
    'Taoyuan': '桃園',
    'Hsinchu': '新竹',
    'Miaoli': '苗栗',
    'Taichung': '台中',
    'Changhua': '彰化',
    'Nantou': '南投',
    'Yunlin': '雲林',
    'Chiayi': '嘉義',
    'Tainan': '台南',
    'Kaohsiung': '高雄',
    'Pingtung': '屏東',
    'Hualien': '花蓮',
    'Taitung': '台東'
  };

  const LocationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      leadingIcon: const Icon(Icons.place),
      trailingIcon: const Icon(null),
      initialSelection: null,
      onSelected: (String? value) async =>
          {await context.read<WeatherCubit>().fetchWeather(value)},
      dropdownMenuEntries: locations.entries.map((entry) {
        return DropdownMenuEntry<String>(value: entry.key, label: entry.value);
      }).toList(),
    );
  }
}
