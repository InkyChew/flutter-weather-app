import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repo/weather_repo.dart' as weather_repo;

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather extends Equatable {
  const CurrentWeather(
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

  factory CurrentWeather.fromRepository(weather_repo.CurrentWeather weather) {
    return CurrentWeather(
        obsTime: weather.obsTime,
        countyName: weather.countyName,
        townName: weather.townName,
        weather: weather.weather,
        visibilityDescription: weather.visibilityDescription,
        sunshineDuration: weather.sunshineDuration,
        precipitation: weather.precipitation,
        windDirection: weather.windDirection,
        windSpeed: weather.windSpeed,
        airTemperature: weather.airTemperature,
        relativeHumidity: weather.relativeHumidity,
        airPressure: weather.airPressure,
        uvIndex: weather.uvIndex);
  }

  static final empty = CurrentWeather(
    obsTime: DateTime(0),
    countyName: '-',
    townName: '-',
    weather: '-',
    visibilityDescription: '-',
    sunshineDuration: 0,
    precipitation: 0,
    windDirection: 0,
    windSpeed: 0,
    airTemperature: 0,
    relativeHumidity: 0,
    airPressure: 0,
    uvIndex: 0,
  );

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
  List<Object> get props => [
        obsTime,
        countyName,
        townName,
        weather,
        visibilityDescription,
        sunshineDuration,
        precipitation,
        windDirection,
        windSpeed,
        airTemperature,
        relativeHumidity,
        airPressure,
        uvIndex
      ];

  CurrentWeather copyWith({
    DateTime? obsTime,
    String? countyName,
    String? townName,
    String? weather,
    String? visibilityDescription,
    double? sunshineDuration,
    double? precipitation,
    double? windDirection,
    double? windSpeed,
    double? airTemperature,
    int? relativeHumidity,
    double? airPressure,
    double? uvIndex,
  }) {
    return CurrentWeather(
      obsTime: obsTime ?? this.obsTime,
      countyName: countyName ?? this.countyName,
      townName: townName ?? this.townName,
      weather: weather ?? this.weather,
      visibilityDescription:
          visibilityDescription ?? this.visibilityDescription,
      sunshineDuration: sunshineDuration ?? this.sunshineDuration,
      precipitation: precipitation ?? this.precipitation,
      windDirection: windDirection ?? this.windDirection,
      windSpeed: windSpeed ?? this.windSpeed,
      airTemperature: airTemperature ?? this.airTemperature,
      relativeHumidity: relativeHumidity ?? this.relativeHumidity,
      airPressure: airPressure ?? this.airPressure,
      uvIndex: uvIndex ?? this.uvIndex,
    );
  }
}
