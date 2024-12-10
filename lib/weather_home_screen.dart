import 'package:flutter/material.dart';
import 'package:weather/weather_detail_card.dart';

class WeatherHomeScreen extends StatelessWidget {
  
  static const weeks = ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'];
  const WeatherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Implement settings functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Weather Overview
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    // Location
                    'New York',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Current Weather',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.wb_sunny, size: 60, color: Colors.orange),
                      SizedBox(width: 10),
                      Text(
                        '28°C', // Current Temperature
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    // Weather description
                    'Clear Skies',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Row(
                    // Wind Speed, UV Index, and AQI
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WeatherDetailCard(
                        title: 'Wind Speed',
                        value: '15 km/h',
                        icon: Icons.air,
                      ),
                      WeatherDetailCard(
                        title: 'UV Index',
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
                          child: Column(
                            children: [
                              Text(weeks[index]), // Day
                              const Icon(Icons.cloud, size: 30),
                              const Text('20-28°C'), // Low - High
                            ]
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
