import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_example/clean_architecture/domain/permission/I_permission_service.dart';
import 'package:bloc_example/clean_architecture/domain/permission/location_permission_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'permission_state.dart';
part 'permission_cubit.freezed.dart';

@lazySingleton
class PermissionCubit extends Cubit<PermissionState> {
  final IPermissionService _iPermissionService;
  StreamSubscription? _locationServiceStatusSubscription;
  PermissionCubit(this._iPermissionService) : super(PermissionState.initial()) {
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
  }
  @override
  Future<void> close() async {
    await _locationServiceStatusSubscription?.cancel();
    super.close();
  }

  Future<void> requestLocationPermission() async {
    final status = await _iPermissionService.requestLocationPermission();
    final bool isGranted = status == LocationPermissionStatus.granted;
    emit(state.copyWith(isLocationPermissionGranted: isGranted));
  }
}
