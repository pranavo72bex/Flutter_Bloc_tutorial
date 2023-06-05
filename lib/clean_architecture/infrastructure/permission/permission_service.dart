import 'package:bloc_example/clean_architecture/domain/permission/I_permission_service.dart';
import 'package:bloc_example/clean_architecture/domain/permission/location_permission_status.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPermissionService)
class PermissionService implements IPermissionService {
  @override
  Future<bool> isLocationPermissionGranted() async {
    final status = await Geolocator.checkPermission();

    final isGranted = status == LocationPermission.always ||
        status == LocationPermission.whileInUse;
    return isGranted;
  }

  @override
  Future<bool> isLocationServicesEnabled() {
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Stream<bool> get locationServicesStatusStream =>
      Geolocator.getServiceStatusStream().map(
        (serviceStatus) => serviceStatus == ServiceStatus.enabled,
      );

  @override
  Future<LocationPermissionStatus> requestLocationPermission() async {
    final status = await Geolocator.requestPermission();
    LocationPermissionStatus result = LocationPermissionStatus.granted;
    if (status == LocationPermission.deniedForever) {
      result = LocationPermissionStatus.permanentlyDenied;
    } else if (status == LocationPermission.denied ||
        status == LocationPermission.unableToDetermine) {
      result = LocationPermissionStatus.denied;
    }
    return result;
  }
}
