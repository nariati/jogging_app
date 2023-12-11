part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

final class MapInitializedEvent extends MapEvent {
  final GoogleMapController controller;

  const MapInitializedEvent(this.controller);
}
