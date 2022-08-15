part of 'searched_location_bloc.dart';

@immutable
abstract class SearchedLocationState extends Equatable {
  const SearchedLocationState();

  @override
  List<Object?> get props => [];
}

class SearchedLocationStateInitial extends SearchedLocationState {}

class SearchedLocationStateLoading extends SearchedLocationState {}

class SearchedLocationStateLoaded extends SearchedLocationState {
  final List<SearchModel> searchModel;

  const SearchedLocationStateLoaded(this.searchModel);

  @override
  List<Object?> get props => [searchModel];
}

class SearchedLocationStateError extends SearchedLocationState {
  final String error;

  const SearchedLocationStateError(this.error);

  @override
  List<Object?> get props => [error];
}
