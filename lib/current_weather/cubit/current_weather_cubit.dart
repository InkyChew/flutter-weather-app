import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather/current_weather/models/models.dart';
import 'package:weather_repo/weather_repo.dart' show WeatherRepo;
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'current_weather_cubit.g.dart';
part 'current_weather_state.dart';

class WeatherCubit extends HydratedCubit<CurrentWeatherState> {
  WeatherCubit(this._weatherRepo) : super(CurrentWeatherState());

  final WeatherRepo _weatherRepo;

  Future<void> fetchWeather(double latitude, double longitude) async {
    if (latitude == 0 || longitude == 0) return;

    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weather = CurrentWeather.fromRepository(
        await _weatherRepo.getWeather(latitude, longitude),
      );

      emit(
        state.copyWith(
          status: WeatherStatus.success,
          weather: weather,
        ),
      );
    } on Exception catch (e) {
      // ignore: avoid_print
      print('Error occurred: $e');
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  // Future<void> refreshWeather() async {
  //   if (!state.status.isSuccess) return;
  //   if (state.weather == CurrentWeather.empty) return;
  //   try {
  //     final weather = CurrentWeather.fromRepository(
  //       await _weatherRepo.getWeather(state.weather.location),
  //     );
  //     final units = state.temperatureUnits;
  //     final value = units.isFahrenheit
  //         ? weather.temperature.value.toFahrenheit()
  //         : weather.temperature.value;

  //     emit(
  //       state.copyWith(
  //         status: WeatherStatus.success,
  //         temperatureUnits: units,
  //         weather: weather.copyWith(temperature: Temperature(value: value)),
  //       ),
  //     );
  //   } on Exception {
  //     emit(state);
  //   }
  // }

  @override
  CurrentWeatherState fromJson(Map<String, dynamic> json) =>
      CurrentWeatherState.fromJson(json);

  @override
  Map<String, dynamic> toJson(CurrentWeatherState state) => state.toJson();
}
