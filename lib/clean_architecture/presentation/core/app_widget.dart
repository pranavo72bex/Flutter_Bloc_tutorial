import 'package:bloc_example/clean_architecture/application/application_life_cycle/application_life_cyle_cubit.dart';
import 'package:bloc_example/clean_architecture/application/permission/permission_cubit.dart';
import 'package:bloc_example/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../map/map_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<PermissionCubit>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => getIt<ApplicationLifeCyleCubit>(),
          lazy: false,
        )
      ],
      child: BlocProvider(
        create: (context) => getIt<PermissionCubit>(),
        lazy: false,
        child: MaterialApp(
          title: 'Map App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MapPage(), //Replace this with CounterExample
        ),
      ),
    );
  }
}
