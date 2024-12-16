import 'package:flutter/material.dart';
import 'package:weather/uvIndex/models/models.dart';

class UvIndexWidget extends StatelessWidget {
  const UvIndexWidget({super.key, required this.uvIndex});

  final double uvIndex; 

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.star,
          size: 40,
          color: getUVIndexLevel(uvIndex).color,
        ),
        Positioned(
          top: 10,
          child: Text(
            '$uvIndex',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
        ),
      ],
    );
  }
}

extension UVIndexLevelExtension on UVIndexLevel {
  Color get color {
    switch (this) {
      case UVIndexLevel.low:
        return Colors.green; // Low UV index (0-2)
      case UVIndexLevel.moderate:
        return Colors.yellow; // Moderate UV index (3-5)
      case UVIndexLevel.high:
        return Colors.orange; // High UV index (6-7)
      case UVIndexLevel.veryHigh:
        return Colors.red; // Very high UV index (8-10)
      case UVIndexLevel.extreme:
        return Colors.purple; // Extreme UV index (11+)
      case UVIndexLevel.error:
        return Colors.grey; // Instrument Error (X)
      case UVIndexLevel.missing:
        return Colors.black12; // Missing data (-99)
      default:
        return Colors.transparent; // Default for any undefined cases
    }
  }
}
