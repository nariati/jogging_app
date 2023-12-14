part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class ShowManualMarkerEvent extends SearchEvent {
  const ShowManualMarkerEvent(this.showManualMarker);

  final bool showManualMarker;

  @override
  List<Object> get props => [showManualMarker];
}