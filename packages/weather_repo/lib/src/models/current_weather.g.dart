// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      obsTime: DateTime.parse(json['obsTime'] as String),
      countyName: json['countyName'] as String,
      townName: json['townName'] as String,
      weather: json['weather'] as String,
      visibilityDescription: json['visibilityDescription'] as String,
      sunshineDuration: (json['sunshineDuration'] as num).toDouble(),
      precipitation: (json['precipitation'] as num).toDouble(),
      windDirection: (json['windDirection'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      airTemperature: (json['airTemperature'] as num).toDouble(),
      relativeHumidity: (json['relativeHumidity'] as num).toInt(),
      airPressure: (json['airPressure'] as num).toDouble(),
      uvIndex: (json['uvIndex'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'obsTime': instance.obsTime.toIso8601String(),
      'countyName': instance.countyName,
      'townName': instance.townName,
      'weather': instance.weather,
      'visibilityDescription': instance.visibilityDescription,
      'sunshineDuration': instance.sunshineDuration,
      'precipitation': instance.precipitation,
      'windDirection': instance.windDirection,
      'windSpeed': instance.windSpeed,
      'airTemperature': instance.airTemperature,
      'relativeHumidity': instance.relativeHumidity,
      'airPressure': instance.airPressure,
      'uvIndex': instance.uvIndex,
    };
