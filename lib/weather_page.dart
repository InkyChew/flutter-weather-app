import 'package:flutter/material.dart';
import 'package:weather/current_weather/current_weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [CurrentWeatherCard()]);
  }
}
