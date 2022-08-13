import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_project/Commons/commons.dart';
import 'package:starter_project/Components/details_grid.dart';
import 'package:starter_project/Components/temparature_graph.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';

import '../../../Components/current_temparature_header.dart';
import '../../../Components/custom_app_bar.dart';
import '../../../Components/forecast_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BuildBody(),
    );
  }
}

class _BuildBody extends StatefulWidget {
  const _BuildBody({Key? key}) : super(key: key);

  @override
  State<_BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<_BuildBody> {
  final WeatherBloc weatherBloc = WeatherBloc();

  @override
  void initState() {
    super.initState();
    weatherBloc.add(GetWeatherDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => weatherBloc,
      child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherStateError) {}
        },
        builder: (context, state) {
          if (state is WeatherStateInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is WeatherStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is WeatherStateError) {
            return Center(child: Text(state.error.toString()));
          }
          if (state is WeatherStateLoaded) {
            return Column(
              children: [
                SafeArea(child: CustomAppBar(state: state)),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CurrentTemparatureHeader(state: state),
                        ForecastCard(state: state),
                        DetailsGrid(state: state),
                        //const TemparatureGraph(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
