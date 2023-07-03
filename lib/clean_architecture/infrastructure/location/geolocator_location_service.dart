import 'package:bloc_example/clean_architecture/domain/location/i_location_service.dart';
import 'package:bloc_example/clean_architecture/domain/location/location_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IlocationService)
class GeolocatorLocationService implements IlocationService {
  @override
  Stream<LocationModel> get positionStream => Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      )).map(
        (Position position) => LocationModel(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );
}
