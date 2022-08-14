import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:starter_project/Features/AirQuality/Model/air_quality_scale_model.dart';
import 'package:starter_project/Features/AirQuality/Presentation/current_pollutants_fragment.dart';
import 'package:starter_project/Utils/app_utils.dart';
import 'package:starter_project/Widgets/custom_appbar.dart';

import '../../../Commons/commons.dart';
import '../../../Widgets/neumorphic_card.dart';
import '../../Home/Bloc/weather_bloc.dart';
import 'air_quality_scale_fragment.dart';

class AirQualityScreen extends StatefulWidget {
  final WeatherStateLoaded state;

  const AirQualityScreen({Key? key, required this.state}) : super(key: key);

  @override
  State<AirQualityScreen> createState() => _AirQualityScreenState();
}

class _AirQualityScreenState extends State<AirQualityScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: CustomAppBar(
          state: widget.state,
          title: 'Air Quality Index',
          icon: AppIcons.airQuality,
        ),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              //height: 56,
              child: TabBar(controller: tabController, tabs: const [
                Tab(
                  text: 'Current Pollutants',
                ),
                Tab(
                  text: 'Air Quality Scale',
                ),
              ]),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  CurrentPollutantsFragment(state: widget.state),
                  const AirQualityScaleFragment()
                ],
              ),
            )
          ],
        )
        // ListView(
        //     shrinkWrap: true,
        //     padding:
        //         const EdgeInsets.symmetric(horizontal: AppSizes.kDefaultPadding),
        //     physics: const BouncingScrollPhysics(),
        //     children: [
        //       const SizedBox(height: AppSizes.dimen8),
        //       Text(
        //         'Current Pollutants'.toUpperCase(),
        //         style: const TextStyle(
        //             color: AppColors.darkGrey,
        //             fontSize: AppSizes.bodyText1,
        //             fontWeight: FontWeight.w500),
        //       ),

        //       const SizedBox(height: AppSizes.kDefaultPadding),
        //       Text(
        //         'Air Quality Scale'.toUpperCase(),
        //         style: const TextStyle(
        //             color: AppColors.darkGrey,
        //             fontSize: AppSizes.bodyText1,
        //             fontWeight: FontWeight.w500),
        //       ),
        //       const SizedBox(height: AppSizes.kDefaultPadding),
        //       Expanded(
        //       ),
        //     ]),
        );
  }
}
