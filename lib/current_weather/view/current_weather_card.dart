import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/current_weather/current_weather.dart';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<WeatherCubit, CurrentWeatherState>(
        builder: (context, state) {
          return switch (state.status) {
            WeatherStatus.initial => const Text("Initial"),
            WeatherStatus.loading => const CircularProgressIndicator(),
            WeatherStatus.failure => const Text("Something went wrong!"),
            WeatherStatus.success =>
              CurrentWeatherLoaded(weather: state.weather),
          };
        },
      ),
    );
  }
}

class CurrentWeatherLoaded extends StatelessWidget {
  const CurrentWeatherLoaded({super.key, required this.weather});
  final CurrentWeather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Weather"),
        Text('${weather.countyName} ${weather.townName}'),
        Text('${weather.airTemperature}℃'),
        Text(weather.weather),
        Text('${weather.precipitation}mm'),
        Text('${weather.uvIndex}'),
        Text('${weather.obsTime}'),
      ]
    );
  }
}
