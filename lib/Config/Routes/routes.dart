import 'package:flutter/material.dart';
import 'package:starter_project/Features/Home/Presentation/home_screen.dart';

class Routes {
  Routes._();

  static const String home = '/home';

  ///
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomeScreen(),
  };
}
