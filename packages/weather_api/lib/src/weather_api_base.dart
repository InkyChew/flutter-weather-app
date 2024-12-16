import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/weather_api.dart';

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

class WeatherApiClient {
  WeatherApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _key = 'CWA-20E4AE1B-09BA-416D-93CD-A604C5F106A5';
  static const _baseUrlWeather = 'opendata.cwa.gov.tw';

  final http.Client _httpClient;

  Future<List<Station>> getWeatherStations() async {
    final weatherRequest = Uri.https(_baseUrlWeather,
        '/api/v1/rest/datastore/O-A0003-001', {'Authorization': _key});

    final weatherResponse = await _httpClient.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final bodyJson = jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    if (!bodyJson.containsKey('records')) {
      throw WeatherNotFoundFailure();
    }

    return StationData.fromJson(bodyJson).records.station;
  }
}
