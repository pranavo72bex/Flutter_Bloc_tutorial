// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'clean_architecture/application/application_life_cycle/application_life_cyle_cubit.dart'
    as _i3;
import 'clean_architecture/application/permission/permission_cubit.dart' as _i8;
import 'clean_architecture/domain/location/i_location_service.dart' as _i6;
import 'clean_architecture/domain/permission/I_permission_service.dart' as _i4;
import 'clean_architecture/infrastructure/location/geolocator_location_service.dart'
    as _i7;
import 'clean_architecture/infrastructure/permission/permission_service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.ApplicationLifeCyleCubit>(
      () => _i3.ApplicationLifeCyleCubit());
  gh.lazySingleton<_i4.IPermissionService>(() => _i5.PermissionService());
  gh.factory<_i6.IlocationService>(() => _i7.GeolocatorLocationService());
  gh.lazySingleton<_i8.PermissionCubit>(() => _i8.PermissionCubit(
        get<_i4.IPermissionService>(),
        get<_i3.ApplicationLifeCyleCubit>(),
      ));
  return get;
}
