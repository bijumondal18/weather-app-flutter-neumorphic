part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class GetWeatherDataEvent extends WeatherEvent {}

class GetSearchedWeatherDataEvent extends WeatherEvent {
  final String query;

  const GetSearchedWeatherDataEvent(this.query);

  @override
  List<Object?> get props => [query];
}
