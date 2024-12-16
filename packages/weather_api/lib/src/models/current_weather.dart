class StationData {
  String success;
  Result result;
  Records records;

  StationData({required this.success, required this.result, required this.records});

  factory StationData.fromJson(Map<String, dynamic> json) {
    return StationData(
      success: json['success'],
      result: Result.fromJson(json['result']),
      records: Records.fromJson(json['records']),
    );
  }
}

class Result {
  String resourceId;
  List<Field> fields;

  Result({required this.resourceId, required this.fields});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      resourceId: json['resource_id'],
      fields: List<Field>.from(json['fields'].map((x) => Field.fromJson(x))),
    );
  }
}

class Field {
  String id;
  String type;

  Field({required this.id, required this.type});

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      id: json['id'],
      type: json['type'],
    );
  }
}

class Records {
  List<Station> station;

  Records({required this.station});

  factory Records.fromJson(Map<String, dynamic> json) {
    return Records(
      station: List<Station>.from(json['Station'].map((x) => Station.fromJson(x))),
    );
  }
}

class Station {
  String stationName;
  String stationId;
  ObsTime obsTime;
  GeoInfo geoInfo;
  WeatherElement weatherElement;

  Station({
    required this.stationName,
    required this.stationId,
    required this.obsTime,
    required this.geoInfo,
    required this.weatherElement,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      stationName: json['StationName'],
      stationId: json['StationId'],
      obsTime: ObsTime.fromJson(json['ObsTime']),
      geoInfo: GeoInfo.fromJson(json['GeoInfo']),
      weatherElement: WeatherElement.fromJson(json['WeatherElement']),
    );
  }
}

class ObsTime {
  DateTime dateTime;

  ObsTime({required this.dateTime});

  factory ObsTime.fromJson(Map<String, dynamic> json) {
    return ObsTime(
      dateTime: DateTime.parse(json['DateTime']),
    );
  }
}

class GeoInfo {
  List<Coordinate> coordinates;
  String stationAltitude;
  String countyName;
  String townName;
  String countyCode;
  String townCode;

  GeoInfo({
    required this.coordinates,
    required this.stationAltitude,
    required this.countyName,
    required this.townName,
    required this.countyCode,
    required this.townCode,
  });

  factory GeoInfo.fromJson(Map<String, dynamic> json) {
    return GeoInfo(
      coordinates: List<Coordinate>.from(json['Coordinates'].map((x) => Coordinate.fromJson(x))),
      stationAltitude: json['StationAltitude'],
      countyName: json['CountyName'],
      townName: json['TownName'],
      countyCode: json['CountyCode'],
      townCode: json['TownCode'],
    );
  }
}

class Coordinate {
  String coordinateName;
  String coordinateFormat;
  double stationLatitude;
  double stationLongitude;

  Coordinate({
    required this.coordinateName,
    required this.coordinateFormat,
    required this.stationLatitude,
    required this.stationLongitude,
  });

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      coordinateName: json['CoordinateName'],
      coordinateFormat: json['CoordinateFormat'],
      stationLatitude: json['StationLatitude'].toDouble(),
      stationLongitude: json['StationLongitude'].toDouble(),
    );
  }
}

class WeatherElement {
  String weather;
  String visibilityDescription;
  double sunshineDuration;
  Now now;
  double windDirection;
  double windSpeed;
  double airTemperature;
  int relativeHumidity;
  double airPressure;
  double uvIndex;
  // Max10MinAverage max10MinAverage;
  // GustInfo gustInfo;
  // DailyExtreme dailyExtreme;

  WeatherElement({
    required this.weather,
    required this.visibilityDescription,
    required this.sunshineDuration,
    required this.now,
    required this.windDirection,
    required this.windSpeed,
    required this.airTemperature,
    required this.relativeHumidity,
    required this.airPressure,
    required this.uvIndex,
    // required this.max10MinAverage,
    // required this.gustInfo,
    // required this.dailyExtreme,
  });

  factory WeatherElement.fromJson(Map<String, dynamic> json) {
    return WeatherElement(
      weather: json['Weather'],
      visibilityDescription: json['VisibilityDescription'],
      sunshineDuration: json['SunshineDuration'].toDouble(),
      now: Now.fromJson(json['Now']),
      windDirection: json['WindDirection'].toDouble(),
      windSpeed: json['WindSpeed'].toDouble(),
      airTemperature: json['AirTemperature'].toDouble(),
      relativeHumidity: json['RelativeHumidity'],
      airPressure: json['AirPressure'].toDouble(),
      uvIndex: json['UVIndex'].toDouble(),
      // max10MinAverage: Max10MinAverage.fromJson(json['Max10MinAverage']),
      // gustInfo: GustInfo.fromJson(json['GustInfo']),
      // dailyExtreme: DailyExtreme.fromJson(json['DailyExtreme']),
    );
  }
}

class Now {
  double precipitation;

  Now({required this.precipitation});

  factory Now.fromJson(Map<String, dynamic> json) {
    return Now(
      precipitation: json['Precipitation'].toDouble(),
    );
  }
}

class Max10MinAverage {
  double windSpeed;
  OccurredAt occurredAt;

  Max10MinAverage({required this.windSpeed, required this.occurredAt});

  factory Max10MinAverage.fromJson(Map<String, dynamic> json) {
    return Max10MinAverage(
      windSpeed: json['WindSpeed'].toDouble(),
      occurredAt: OccurredAt.fromJson(json['Occurred_at']),
    );
  }
}

class GustInfo {
  double peakGustSpeed;
  OccurredAt occurredAt;

  GustInfo({required this.peakGustSpeed, required this.occurredAt});

  factory GustInfo.fromJson(Map<String, dynamic> json) {
    return GustInfo(
      peakGustSpeed: json['PeakGustSpeed'].toDouble(),
      occurredAt: OccurredAt.fromJson(json['Occurred_at']),
    );
  }
}

class OccurredAt {
  double windDirection;
  DateTime dateTime;

  OccurredAt({required this.windDirection, required this.dateTime});

  factory OccurredAt.fromJson(Map<String, dynamic> json) {
    return OccurredAt(
      windDirection: json['WindDirection'].toDouble(),
      dateTime: DateTime.parse(json['DateTime']),
    );
  }
}

class DailyExtreme {
  TemperatureInfo dailyHigh;
  TemperatureInfo dailyLow;

  DailyExtreme({required this.dailyHigh, required this.dailyLow});

  factory DailyExtreme.fromJson(Map<String, dynamic> json) {
    return DailyExtreme(
      dailyHigh: TemperatureInfo.fromJson(json['DailyHigh']['TemperatureInfo']),
      dailyLow: TemperatureInfo.fromJson(json['DailyLow']['TemperatureInfo']),
    );
  }
}

class TemperatureInfo {
  double airTemperature;
  DateTime occurredAt;

  TemperatureInfo({required this.airTemperature, required this.occurredAt});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    return TemperatureInfo(
      airTemperature: json['AirTemperature'].toDouble(),
      occurredAt: DateTime.parse(json['Occurred_at']['DateTime']),
    );
  }
}