import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:starter_project/Features/Home/Model/response_model.dart';
import 'package:starter_project/Features/Home/Repository/weather_repository.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherStateInitial()) {
    final WeatherRepository repository = WeatherRepository();

    on<GetWeatherDataEvent>((event, emit) async {
      try {
        emit(WeatherStateLoading());
        final mData = await repository.fetchWeatherData();
        emit(WeatherStateLoaded(mData));
      } catch (e) {
        emit(WeatherStateError(e.toString()));
      }
    });
  }
}
