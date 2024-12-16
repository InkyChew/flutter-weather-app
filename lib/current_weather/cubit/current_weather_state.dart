part of 'current_weather_cubit.dart';

enum WeatherStatus { initial, loading, success, failure }

extension CurrentWeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

@JsonSerializable()
final class CurrentWeatherState extends Equatable {
  CurrentWeatherState({
    this.status = WeatherStatus.initial,
    CurrentWeather? weather,
  }) : weather = weather ?? CurrentWeather.empty;

  factory CurrentWeatherState.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherStateFromJson(json);

  final WeatherStatus status;
  final CurrentWeather weather;

  CurrentWeatherState copyWith({
    WeatherStatus? status,
    CurrentWeather? weather,
  }) {
    return CurrentWeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
    );
  }

  Map<String, dynamic> toJson() => _$CurrentWeatherStateToJson(this);

  @override
  List<Object?> get props => [status, weather];
}
