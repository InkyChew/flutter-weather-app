import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/current_weather/current_weather.dart';
import 'package:weather/location/cubit/location_cubit.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: BlocListener<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state is LocationLoaded) {
            context.read<WeatherCubit>().fetchWeather(
                  state.position.latitude,
                  state.position.longitude,
                );
          }
          if (state is LocationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error: Unable to fetch location')),
            );
          }
        },
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state is LocationInitial) {
              return IconButton(onPressed: () => context.read<LocationCubit>().getLocation(), icon: const Icon(Icons.place));
            }
            if (state is LocationLoading) {
              return const CircularProgressIndicator();
            }
            if (state is LocationLoaded) {
              return Text('${state.position.latitude}, ${state.position.longitude}');
            }
            return const Text('Location not loaded.');
          },
        ),
      ),
    );
  }
}
