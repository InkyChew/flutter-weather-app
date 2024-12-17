import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/current_weather/current_weather.dart';
import 'package:weather/uvIndex/view/uv_index_widget.dart';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, CurrentWeatherState>(
      builder: (context, state) {
        return Card(
            child: switch (state.status) {
          WeatherStatus.initial => CurrentWeatherLoaded(weather: state.weather),
          WeatherStatus.loading => const CircularProgressIndicator(),
          WeatherStatus.failure => const Text("Something went wrong!"),
          WeatherStatus.success => CurrentWeatherLoaded(weather: state.weather),
        });
      },
    );
  }
}

class CurrentWeatherLoaded extends StatelessWidget {
  const CurrentWeatherLoaded({super.key, required this.weather});
  final CurrentWeather weather;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(weather.countyName),
      Text('${weather.airTemperature}℃'),
      Text(weather.weather),
      UvIndexWidget(uvIndex: weather.uvIndex),
      Text('${weather.obsTime}'),
    ]);
  }
}
