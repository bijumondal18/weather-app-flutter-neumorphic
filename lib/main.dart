import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starter_project/Commons/theme.dart';
import 'package:starter_project/Features/Home/Presentation/home_screen.dart';
import 'package:starter_project/Utils/app_utils.dart';

void main() {
 // WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
