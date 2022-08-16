import 'package:flutter/material.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Widgets/custom_appbar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final WeatherStateLoaded state;

  const PrivacyPolicyScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Privacy Policy',
        icon: '',
        onBackPressed: () {
          Navigator.pop(context);
        },
        state: state,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [Text('data')],
        ),
      ),
    );
  }
}
