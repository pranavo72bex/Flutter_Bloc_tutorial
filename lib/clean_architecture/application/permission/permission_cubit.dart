import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_example/clean_architecture/application/application_life_cycle/application_life_cyle_cubit.dart';
import 'package:bloc_example/clean_architecture/domain/permission/I_permission_service.dart';
import 'package:bloc_example/clean_architecture/domain/permission/location_permission_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
part 'permission_state.dart';
part 'permission_cubit.freezed.dart';

@lazySingleton
class PermissionCubit extends Cubit<PermissionState> {
  final IPermissionService _iPermissionService;
  final ApplicationLifeCyleCubit _applicationLifeCyleCubit;
  StreamSubscription<Iterable<ApplicationLifeCyleState>>?
      _appLifeCycleSubscription;
  StreamSubscription? _locationServiceStatusSubscription;
  PermissionCubit(this._iPermissionService, this._applicationLifeCyleCubit)
      : super(PermissionState.initial()) {
    _iPermissionService.isLocationPermissionGranted().then(
      (bool isLocationPermissionGranted) {
        emit(state.copyWith(
            isLocationPermissionGranted: isLocationPermissionGranted));
      },
    );
    _iPermissionService.isLocationServicesEnabled().then(
      (bool isLocationServicesEnabled) {
        emit(state.copyWith(
          isLocationServicesEnabled: isLocationServicesEnabled,
        ));
      },
    );

    _locationServiceStatusSubscription = _iPermissionService
        .locationServicesStatusStream
        .listen((isLocationServicesEnabled) {
      emit(
          state.copyWith(isLocationServicesEnabled: isLocationServicesEnabled));
    });

    _appLifeCycleSubscription = _applicationLifeCyleCubit.stream
        .startWith(_applicationLifeCyleCubit.state)
        .pairwise()
        .listen((pair) async {
      final previous = pair.first;
      final current = pair.last;
      if (previous.isResumed != current.isResumed && current.isResumed) {
        bool isGranted =
            await _iPermissionService.isLocationPermissionGranted();
        emit(state.copyWith(isLocationPermissionGranted: isGranted));
      }
    });
  }
  @override
  Future<void> close() async {
    await _locationServiceStatusSubscription?.cancel();
    await _appLifeCycleSubscription?.cancel();
    super.close();
  }

  Future<void> requestLocationPermission() async {
    final status = await _iPermissionService.requestLocationPermission();
    final bool isGranted = status == LocationPermissionStatus.granted;
    emit(state.copyWith(isLocationPermissionGranted: isGranted));
  }
}
