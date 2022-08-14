import 'package:flutter/material.dart';
import 'package:starter_project/Widgets/neumorphic_card.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';
import '../Features/Home/Bloc/weather_bloc.dart';

class SunsetSunriseCard extends StatelessWidget {
  final WeatherStateLoaded state;

  const SunsetSunriseCard({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.10,
      child: NeumorphicCard(
        isClickable: true,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.responseModel.forecast!.forecastday![0].astro!.sunrise}',
                    style: const TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: AppSizes.bodyText1,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    'Sunrise',
                    style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: AppSizes.bodyText2,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                width: AppSizes.kDefaultPadding,
              ),
              Expanded(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius:
                          BorderRadius.circular(AppSizes.cardCornerRadius)),
                ),
              ),
              const SizedBox(
                width: AppSizes.kDefaultPadding,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.responseModel.forecast!.forecastday![0].astro!.sunset}',
                    style: const TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: AppSizes.bodyText1,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    'Sunset',
                    style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: AppSizes.bodyText2,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
