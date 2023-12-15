import 'package:get_it/get_it.dart';
import 'package:tracking_app/src/packages/data/device/application.dart';
import 'package:tracking_app/src/packages/data/routes/routes.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/traffic/traffic_service.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/traffic/traffic_mapper.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/traffic/traffic_service_impl.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/gps_permissions.dart';

import '../../src/packages/features/tracking/tracking.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Data

  /// Device
  ///
  // Use Cases
  sl.registerLazySingleton(() => const AskGpsAccess());
  sl.registerLazySingleton(() => const CheckPermissionGranted());
  sl.registerLazySingleton(() => const GpsCurrentStatus());
  sl.registerLazySingleton(() => const GpsInitialStatus());
  sl.registerLazySingleton(() => const OpenAppSettings());
  sl.registerLazySingleton(() => const GetCurrentPosition());
  sl.registerLazySingleton(() => const GetPositionStream());

  /// Traffic
  ///
  // Application
  sl.registerLazySingleton(() => GetRoutes(sl()));
  // Application
  sl.registerLazySingleton<TrafficService>(
      () => TrafficServiceImpl(sl(), sl()));
  // Infrastructure
  sl.registerLazySingleton(() => const TrafficMapper());
  sl.registerLazySingleton(() => TrafficApiClient());

  /// Features
  /// GPS Permissions
  // Bloc
  sl.registerFactory(
    () => GpsPermissionsBloc(
      sl(),
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );

  /// Tracking
  // Bloc
  sl.registerFactory(() => LocationBloc(sl(), sl()));
  sl.registerFactory(() => SearchBloc(sl()));
}
