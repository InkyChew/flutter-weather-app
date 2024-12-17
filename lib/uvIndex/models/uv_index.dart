enum UVIndexLevel {
  low,         // 0-2
  moderate,    // 3-5
  high,        // 6-7
  veryHigh,    // 8-10
  extreme,     // 11+
  error,       // X (Instrument Error)
  missing, color      // -99 (Missing or Abnormal Data)
}

String getUVIndex(double uvIndex) {
  switch (uvIndex)  {
    case > 11 : return '11+';
    case -99 : return '-';
  }
  return '$uvIndex';
}

UVIndexLevel getUVIndexLevel(double uvIndex) {
  if (uvIndex < 0) {
    return UVIndexLevel.missing; // Handling negative values or abnormal data
  }
  if (uvIndex <= 2) {
    return UVIndexLevel.low;
  } else if (uvIndex <= 5) {
    return UVIndexLevel.moderate;
  } else if (uvIndex <= 7) {
    return UVIndexLevel.high;
  } else if (uvIndex <= 10) {
    return UVIndexLevel.veryHigh;
  } else if (uvIndex >= 11) {
    return UVIndexLevel.extreme;
  }
  return UVIndexLevel.error; // Handling invalid values
}