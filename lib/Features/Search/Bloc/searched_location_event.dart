part of 'searched_location_bloc.dart';

@immutable
abstract class SearchedLocationEvent {
  const SearchedLocationEvent();

  @override
  List<Object?> get props => [];
}

class GetSearchedLocationEvent extends SearchedLocationEvent {
  final String query;

  const GetSearchedLocationEvent(this.query);

  @override
  List<Object?> get props => [query];
}
