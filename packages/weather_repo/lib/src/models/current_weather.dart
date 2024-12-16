import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather extends Equatable {
  CurrentWeather(
      {required this.obsTime,
      required this.countyName,
      required this.townName,
      required this.weather,
      required this.visibilityDescription,
      required this.sunshineDuration,
      required this.precipitation,
      required this.windDirection,
      required this.windSpeed,
      required this.airTemperature,
      required this.relativeHumidity,
      required this.airPressure,
      required this.uvIndex});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);

  final DateTime obsTime;
  final String countyName;
  final String townName;
  final String weather;
  final String visibilityDescription;
  final double sunshineDuration;
  final double precipitation;
  final double windDirection;
  final double windSpeed;
  final double airTemperature;
  final int relativeHumidity;
  final double airPressure;
  final double uvIndex;

  @override
  List<Object> get props => [obsTime, countyName, townName, weather, visibilityDescription, sunshineDuration, precipitation, windDirection, windSpeed, airTemperature, relativeHumidity, airPressure, uvIndex];
}
