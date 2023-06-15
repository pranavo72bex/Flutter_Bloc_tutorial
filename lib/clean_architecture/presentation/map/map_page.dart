import 'package:bloc_example/clean_architecture/application/permission/permission_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<PermissionCubit, PermissionState, bool>(
              selector: (state) {
                return state.isLocationPermissionGranted;
              },
              builder: (context, isLocationPermissionGranted) {
                return Text(
                    "Location permission ${isLocationPermissionGranted ? "enable" : "disable"}");
              },
            ),
            const SizedBox(height: 20),
            BlocSelector<PermissionCubit, PermissionState, bool>(
              selector: (state) {
                return state.isLocationServicesEnabled;
              },
              builder: (context, isLocationServicesEnabled) {
                return Text(
                    "Location Servce ${isLocationServicesEnabled ? "enable" : "disable"}");
              },
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                debugPrint('Location permission btn pressed');
                context.read<PermissionCubit>().requestLocationPermission();
              },
              child: const Text("Location Services button pressed"),
            )
          ],
        ),
      ),
    );
  }
}
