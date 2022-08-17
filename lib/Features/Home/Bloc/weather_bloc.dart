import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:starter_project/Features/Home/Model/response_model.dart';
import 'package:starter_project/Features/Home/Repository/weather_repository.dart';
import 'package:starter_project/Utils/app_preference.dart';
import 'package:starter_project/Utils/app_utils.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherStateInitial()) {
    final WeatherRepository repository = WeatherRepository();
    final AppPreference preference = AppPreference();

    on<GetWeatherDataEvent>((event, emit) async {
      String locationQuery = await AppUtils.getCurrentLocation();
      String fullQuery = '';
      String? loc = '';

      if (await preference.getLocation() != null) {
        loc = await preference.getLocation();
        log('loc - $loc');
      } else {
        loc = locationQuery;
      }
      try {
        emit(WeatherStateLoading());

        fullQuery = '&q=$loc&days=8&aqi=yes&alerts=no';

        final mData = await repository.fetchWeatherData(fullQuery);
       // Future.delayed(const Duration(milliseconds: 2000));
        emit(WeatherStateLoaded(mData));
      } catch (e) {
        emit(WeatherStateError(e.toString()));
      }
    });

    on<GetSearchedWeatherDataEvent>((event, emit) async {
      String fullQuery = '&q=${event.toString()}&days=8&aqi=yes&alerts=no';
      try {
        emit(WeatherStateLoading());
        final mData = await repository.fetchWeatherData(fullQuery);
        preference.setLocation(mData.location!.name!);
        log('-----preference - ${await preference.getLocation()}');
        //Future.delayed(const Duration(milliseconds: 2000));
        emit(WeatherStateLoaded(mData));
      } catch (e) {
        emit(WeatherStateError(e.toString()));
      }
    });
  }
}
