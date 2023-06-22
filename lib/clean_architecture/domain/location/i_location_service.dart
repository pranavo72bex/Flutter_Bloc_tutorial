import 'package:bloc_example/clean_architecture/domain/location/location_model.dart';

abstract class IlocationService {
  Stream<LocationModel> get positionStream;
}
