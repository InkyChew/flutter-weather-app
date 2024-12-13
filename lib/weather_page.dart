import 'package:flutter/material.dart';
import 'package:weather/weather/view/weather_loaded.dart';
import 'package:weather/widgets/location_menu.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  
  String location = 'Taipei';
  void setLocation(String? value) {
    setState(() {
      if(value != null) location = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Weather'),
        actions: [
          LocationMenu(location: location, onSelected: setLocation)
        ],
      ),
      body: const WeatherLoaded(),
    );
  }
}
