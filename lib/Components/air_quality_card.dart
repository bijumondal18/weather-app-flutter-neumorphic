import 'package:flutter/material.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_icons.dart';
import '../Commons/app_sizes.dart';
import '../Features/Home/Bloc/weather_bloc.dart';
import '../Widgets/neumorphic_card.dart';

class AirQualityCard extends StatelessWidget {
  final WeatherStateLoaded state;

  const AirQualityCard({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        child: NeumorphicCard(
            isClickable: false,
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(AppIcons.airQuality),
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(
                            width: AppSizes.kDefaultPadding,
                          ),
                          Text(
                            'Air Quality Index'.toUpperCase(),
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText2,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${state.responseModel.current!.airQuality!.usEpaIndex}',
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.headline1,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            'Moderate',
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.headline6,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
