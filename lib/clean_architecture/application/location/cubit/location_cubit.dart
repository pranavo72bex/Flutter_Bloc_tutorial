import 'package:bloc/bloc.dart';
import 'package:bloc_example/clean_architecture/application/permission/permission_cubit.dart';
import 'package:bloc_example/clean_architecture/domain/location/i_location_service.dart';
import 'package:bloc_example/clean_architecture/domain/location/location_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  final IlocationService _locationService;
  final PermissionCubit _permissionCubit;
  LocationCubit(this._locationService, this._permissionCubit)
      : super(LocationState.initial()) {
    _locationService.positionStream.listen((location) {
      emit(state.copyWith(userLocation: location));
    });
  }
}
