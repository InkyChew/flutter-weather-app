import 'package:flutter/material.dart';
import 'package:weather/location/view/location_view.dart';
import 'package:weather/widgets/weather_detail_card.dart';

class WeatherLoaded extends StatelessWidget {
  const WeatherLoaded({super.key});
  static const weeks = ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current Weather Overview
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [                
                LocationView(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wb_sunny, size: 60, color: Colors.orange),
                    SizedBox(width: 10),
                    Text(
                      '28°', // Current Temperature
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  // Wind Speed, UV Index, and AQI
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WeatherDetailCard(
                      title: 'Wind',
                      value: '15 km/h',
                      icon: Icons.air,
                    ),
                    WeatherDetailCard(
                      title: 'UVI',
                      value: 'High',
                      icon: Icons.wb_sunny,
                      color: Colors.red,
                    ),
                    WeatherDetailCard(
                      title: 'AQI',
                      value: 'Good',
                      icon: Icons.health_and_safety,
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Hourly Forecast
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hourly Forecast',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 24, // For 24 hours forecast
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Text('${index + 1} PM'), // Hour
                            const Icon(Icons.cloud, size: 30), // Weather icon
                            const Text('28°C'), // Hourly Temperature
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Daily Forecast Tab
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '7-Day Forecast',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7, // 7 days
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(children: [
                          Text(weeks[index]), // Day
                          const Icon(Icons.cloud, size: 30),
                          const Text('20-28°C'), // Low - High
                        ]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
