import 'package:bloc/bloc.dart';
import 'package:bloc_example/clean_architecture/domain/location/i_location_service.dart';
import 'package:bloc_example/clean_architecture/domain/location/location_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

class LocationCubit extends Cubit<LocationState> {
  final IlocationService _locationService;
  LocationCubit(this._locationService) : super(LocationState.initial()) {
    _locationService.positionStream.listen((event) {});
  }
}
