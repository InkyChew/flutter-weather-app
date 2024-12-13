import 'package:flutter/material.dart';

class LocationMenu extends StatelessWidget {
  static Map<String, String> locations = {
    'F-D0047-003': '宜蘭',
    'F-D0047-063': '台北',
    'F-D0047-071': '新北',
    'F-D0047-051': '基隆',
    'F-D0047-007': '桃園',
    'F-D0047-055': '新竹',
    'F-D0047-015': '苗栗',
    'F-D0047-075': '台中',
    'F-D0047-019': '彰化',
    'F-D0047-023': '南投',
    'F-D0047-027': '雲林',
    'F-D0047-031': '嘉義',
    'F-D0047-077': '台南',
    'F-D0047-067': '高雄',
    'F-D0047-035': '屏東',
    'F-D0047-043': '花蓮',
    'F-D0047-039': '台東'
  };
  
  final String location;
  final Function(String?) onSelected;

  const LocationMenu(
      {super.key, required this.location, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      leadingIcon: const Icon(Icons.place),
      trailingIcon: const Icon(null),
      initialSelection: location,
      onSelected: (String? value) => onSelected(locations[value]),
      dropdownMenuEntries: locations.entries.map((entry) {
        return DropdownMenuEntry<String>(value: entry.key, label: entry.value);
      }).toList(),
    );
  }
}
