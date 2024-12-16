import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repo/weather_repo.dart';
import 'current_weather/current_weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({required WeatherRepo weatherRepo, super.key})
      : _weatherRepo = weatherRepo;
  final WeatherRepo _weatherRepo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit(_weatherRepo),
      child: const CurrentWeatherCard(),
    );
  }
}
