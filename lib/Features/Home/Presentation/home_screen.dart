import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_project/Commons/commons.dart';
import 'package:starter_project/Commons/constants.dart';
import 'package:starter_project/Components/air_quality_card.dart';
import 'package:starter_project/Components/details_grid.dart';
import 'package:starter_project/Components/temparature_list.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';

import '../../../Components/current_temparature_header.dart';
import '../../../Components/home_appbar.dart';
import '../../../Components/forecast_card.dart';
import '../../../Components/provider_information_card.dart';
import '../../../Components/sunset_sunrise_card.dart';
import '../../../Utils/app_utils.dart';

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
  var refreshKey = GlobalKey<RefreshIndicatorState>();


  @override
  void initState() {
    super.initState();
    //FlutterNativeSplash.remove();
    AppUtils.registerPlatformInstance();
    weatherBloc.add(GetWeatherDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => weatherBloc,
      child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {

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
                SafeArea(bottom: false, child: HomeAppBar(state: state)),
                Expanded(
                  child: RefreshIndicator(
                    key: refreshKey,
                    onRefresh: () async {
                      weatherBloc.add(GetWeatherDataEvent());
                    },
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CurrentTemparatureHeader(state: state),
                          ForecastCard(state: state),
                          TemparatureList(state: state),
                          DetailsGrid(state: state),
                          SunsetSunriseCard(state: state),
                          AirQualityCard(state: state),
                          const ProviderInformation(),
                          const SizedBox(
                            height: AppSizes.dimen40,
                          )
                        ],
                      ),
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
