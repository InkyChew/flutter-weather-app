import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/location/cubit/location_cubit.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          return Container(
            child: switch (state) {
              LocationInitial() => ElevatedButton(
                  onPressed: () {
                    context.read<LocationCubit>().getLocation();
                  },
                  child: const Icon(Icons.place)),
              LocationLoading() => const CircularProgressIndicator(),
              LocationLoaded() =>
                Text('${state.position.latitude}, ${state.position.longitude}'),
              LocationError() => const Text(''),
            },
          );
        },
      ),
    );
  }
}
