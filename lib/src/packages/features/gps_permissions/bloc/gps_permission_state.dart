part of 'gps_permission_bloc.dart';

class GpsPermissionState extends Equatable {
  const GpsPermissionState({
    this.isGpsEnable = false,
    this.isGpsPermissionGranted = false,
  });

  final bool isGpsEnable;
  final bool isGpsPermissionGranted;

  GpsPermissionState copyWith({
    bool? isGpsEnable,
    bool? isGpsPermissionGranted,
  }) =>
      GpsPermissionState(
        isGpsEnable: isGpsEnable ?? this.isGpsEnable,
        isGpsPermissionGranted:
            isGpsPermissionGranted ?? this.isGpsPermissionGranted,
      );

  @override
  List<Object?> get props => [isGpsEnable, isGpsPermissionGranted];
}