import 'dart:async';
import 'dart:math';
import 'package:weather_api/weather_api.dart';
import 'package:weather_repo/weather_repo.dart';

class WeatherRepo {
  WeatherRepo({WeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? WeatherApiClient();

  final WeatherApiClient _weatherApiClient;

  Future<CurrentWeather> getWeather(double latitude, double longitude) async {
    final stations = await _weatherApiClient.getWeatherStations();

    final station = await findNearestStation(stations, latitude, longitude);

    return CurrentWeather(
        obsTime: station.obsTime.dateTime,
        countyName: station.geoInfo.countyName,
        townName: station.geoInfo.townName,
        weather: station.weatherElement.weather,
        visibilityDescription: station.weatherElement.visibilityDescription,
        sunshineDuration: station.weatherElement.sunshineDuration,
        precipitation: station.weatherElement.now.precipitation,
        windDirection: station.weatherElement.windDirection,
        windSpeed: station.weatherElement.windSpeed,
        airTemperature: station.weatherElement.airTemperature,
        relativeHumidity: station.weatherElement.relativeHumidity,
        airPressure: station.weatherElement.airPressure,
        uvIndex: station.weatherElement.uvIndex);
  }
}

// Station? findNearestStation(List<Station> stations, double currentLat, double currentLon) {
//   double minDistance = double.infinity;
//   Station? nearestStation;

//   for (var station in stations) {
//     if (station.geoInfo.coordinates.isNotEmpty) {
//       // Calculate the distance using haversine directly (no Future)
//       double distance = haversine(
//         currentLat,
//         currentLon,
//         station.geoInfo.coordinates[0].stationLatitude,
//         station.geoInfo.coordinates[0].stationLongitude,
//       );

//       // Update the nearest station if this one is closer
//       if (distance < minDistance) {
//         minDistance = distance;
//         nearestStation = station;
//       }
//     }
//   }

//   return nearestStation;
// }

Future<Station> findNearestStation(
    List<Station> stations, double currentLat, double currentLon) async {
  List<Future<double>> futures = [];

  // Create a future for each station to calculate the distance
  for (var station in stations) {
    futures.add(Future.value(
      haversine(
        currentLat,
        currentLon,
        station.geoInfo.coordinates[0].stationLatitude,
        station.geoInfo.coordinates[0].stationLongitude,
      ),
    ));
  }

  // Wait for all distances to be calculated
  List<double> distances = await Future.wait(futures);

  // Find the station with the smallest distance
  int minIndex = distances.indexOf(distances.reduce(min));
  return stations[minIndex];
}

// Function to calculate the distance using the Haversine formula
double haversine(double lat1, double lon1, double lat2, double lon2) {
  // Radius of the Earth in kilometers
  const double R = 6371.0;

  // Convert latitude and longitude from degrees to radians
  double lat1Rad = toRadians(lat1);
  double lon1Rad = toRadians(lon1);
  double lat2Rad = toRadians(lat2);
  double lon2Rad = toRadians(lon2);

  // Differences in coordinates
  double dLat = lat2Rad - lat1Rad;
  double dLon = lon2Rad - lon1Rad;

  // Haversine formula
  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1Rad) * cos(lat2Rad) * sin(dLon / 2) * sin(dLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  // Distance in kilometers
  double distance = R * c;
  return distance;
}

// Helper function to convert degrees to radians
double toRadians(double degrees) {
  return degrees * (pi / 180);
}
