// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherState _$CurrentWeatherStateFromJson(Map<String, dynamic> json) =>
    CurrentWeatherState(
      status: $enumDecodeNullable(_$WeatherStatusEnumMap, json['status']) ??
          WeatherStatus.initial,
      weather: json['weather'] == null
          ? null
          : CurrentWeather.fromJson(json['weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentWeatherStateToJson(
        CurrentWeatherState instance) =>
    <String, dynamic>{
      'status': _$WeatherStatusEnumMap[instance.status]!,
      'weather': instance.weather,
    };

const _$WeatherStatusEnumMap = {
  WeatherStatus.initial: 'initial',
  WeatherStatus.loading: 'loading',
  WeatherStatus.success: 'success',
  WeatherStatus.failure: 'failure',
};
