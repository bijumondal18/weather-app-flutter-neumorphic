import 'package:flutter/material.dart';
import 'package:starter_project/Commons/app_icons.dart';
import 'package:starter_project/Commons/constants.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Widgets/neumorphic_card.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';

class DetailsGrid extends StatelessWidget {
  final WeatherStateLoaded state;

  const DetailsGrid({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Details',
            style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: AppSizes.bodyText1,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: AppSizes.kDefaultPadding),
          Row(
            children: [
              Expanded(
                child: NeumorphicCard(
                    child: Padding(
                  padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(AppIcons.sun),
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(
                            width: AppSizes.kDefaultPadding,
                          ),
                          Text(
                            'UV Index'.toUpperCase(),
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText2,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.kDefaultPadding,
                      ),
                      Text(
                        '${state.responseModel.current!.uv}',
                        style: const TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: AppSizes.headline5,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )),
              ),
              const SizedBox(width: AppSizes.kDefaultPadding),
              Expanded(
                child: NeumorphicCard(
                    child: Padding(
                  padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(AppIcons.wind),
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(
                            width: AppSizes.kDefaultPadding,
                          ),
                          Text(
                            'Wind'.toUpperCase(),
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText2,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.kDefaultPadding,
                      ),
                      Text(
                        Constants.selectedWindSpeedUnit ==
                                'Kilometers per hour (km/h)'
                            ? '${state.responseModel.current!.windKph} km/h'
                            : '${state.responseModel.current!.windMph} mph',
                        style: const TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: AppSizes.headline5,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.kDefaultPadding),
          Row(
            children: [
              Expanded(
                child: NeumorphicCard(
                    child: Padding(
                  padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(AppIcons.feelsLike),
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(
                            width: AppSizes.kDefaultPadding,
                          ),
                          Text(
                            'Feels Like'.toUpperCase(),
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText2,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.kDefaultPadding,
                      ),
                      Text(
                        Constants.selectedTempUnit == '°C'
                            ? '${state.responseModel.current!.feelslikeC}°C'
                            : '${state.responseModel.current!.feelslikeF}°F',
                        style: const TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: AppSizes.headline5,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )),
              ),
              const SizedBox(width: AppSizes.kDefaultPadding),
              Expanded(
                child: NeumorphicCard(
                    child: Padding(
                  padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(AppIcons.humidity),
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(
                            width: AppSizes.kDefaultPadding,
                          ),
                          Text(
                            'Humidity'.toUpperCase(),
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText2,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.kDefaultPadding,
                      ),
                      Text(
                        '${state.responseModel.current!.humidity}%',
                        style: const TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: AppSizes.headline5,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.kDefaultPadding),
          Row(
            children: [
              Expanded(
                child: NeumorphicCard(
                    child: Padding(
                  padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(AppIcons.pressure),
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(
                            width: AppSizes.kDefaultPadding,
                          ),
                          Text(
                            'Pressure'.toUpperCase(),
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText2,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.kDefaultPadding,
                      ),
                      Text(
                        Constants.selectedAtmosphericPressureUnit ==
                                'Millibar (mBar)'
                            ? '${state.responseModel.current!.pressureMb} mBar'
                            : '${state.responseModel.current!.pressureIn} inHg',
                        style: const TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: AppSizes.headline5,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )),
              ),
              const SizedBox(width: AppSizes.kDefaultPadding),
              Expanded(
                child: NeumorphicCard(
                    child: Padding(
                  padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(AppIcons.visibility),
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(
                            width: AppSizes.kDefaultPadding,
                          ),
                          Text(
                            'Visibility'.toUpperCase(),
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText2,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.kDefaultPadding,
                      ),
                      Text(
                        Constants.selectedWindSpeedUnit ==
                                'Kilometers per hour (km/h)'
                            ? '${state.responseModel.current!.visKm} km'
                            : '${state.responseModel.current!.visMiles} miles',
                        style: const TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: AppSizes.headline5,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
