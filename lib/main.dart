import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather/weather_page.dart';
import 'package:weather_repo/weather_repo.dart';
import 'current_weather/current_weather.dart';
import 'location/cubit/location_cubit.dart';
import 'location/view/location_view.dart';

Future<void> main() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            colorSchemeSeed: Colors.deepPurple),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LocationCubit()),
            BlocProvider(create: (_) => WeatherCubit(WeatherRepo())),
          ],
          child: const HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LocationView(),
        WeatherPage(weatherRepo: WeatherRepo()),
      ],
    );
  }
}
