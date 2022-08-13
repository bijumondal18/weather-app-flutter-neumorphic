part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherStateInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateLoaded extends WeatherState {
  final ResponseModel responseModel;

  const WeatherStateLoaded(this.responseModel);

  @override
  List<Object?> get props => [responseModel];
}

class WeatherStateError extends WeatherState {
  final String error;

  const WeatherStateError(this.error);

  @override
  List<Object?> get props => [error];
}
