import 'package:flutter/material.dart';
import 'package:starter_project/Features/Forecast/Presentation/forecast_screen.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Features/Home/Model/response_model.dart';
import 'package:starter_project/Features/Home/Presentation/home_screen.dart';

class Routes {
  Routes._();

  static const String home = '/';
  static const String forecast = '/forecast';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomeScreen(),
    forecast: (BuildContext context) =>  ForecastScreen(state: WeatherStateLoaded(ResponseModel())),
  };
}
