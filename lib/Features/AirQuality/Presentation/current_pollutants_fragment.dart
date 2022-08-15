import 'package:flutter/material.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';

import '../../../Commons/commons.dart';
import '../../../Utils/app_utils.dart';
import '../../../Widgets/neumorphic_card.dart';

class CurrentPollutantsFragment extends StatelessWidget {
  final WeatherStateLoaded state;

  const CurrentPollutantsFragment({Key? key, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var no2 = state.responseModel.current!.airQuality!.no2.toStringAsFixed(2);
    var co = state.responseModel.current!.airQuality!.co.toStringAsFixed(2);
    var o3 = state.responseModel.current!.airQuality!.o3.toStringAsFixed(2);
    var so2 = state.responseModel.current!.airQuality!.so2.toStringAsFixed(2);
    var pm2 = state.responseModel.current!.airQuality!.pm25.toStringAsFixed(2);
    var pm10 = state.responseModel.current!.airQuality!.pm10.toStringAsFixed(2);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.kDefaultPadding),
      child: Column(
        children: [
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
                                image: AssetImage(AppIcons.airQuality),
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(
                                width: AppSizes.kDefaultPadding,
                              ),
                              Text(
                                'NO2'.toUpperCase(),
                                style: const TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: AppSizes.bodyText2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSizes.dimen8,
                          ),
                          Text(
                            AppUtils.getAirQualityStatus(
                                state.responseModel.current!.airQuality!.no2),
                            style: TextStyle(
                                color: AppUtils.getAirQualityStatusColor(
                                    state.responseModel.current!.airQuality!.no2),
                                fontSize: AppSizes.headline6,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: AppSizes.dimen4,
                          ),
                          Text(
                            no2,
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.headline5,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: AppSizes.dimen4,
                          ),
                          const Text(
                            '2 μg/m3',
                            style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText1,
                                fontWeight: FontWeight.w400),
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
                                image: AssetImage(AppIcons.airQuality),
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(
                                width: AppSizes.kDefaultPadding,
                              ),
                              Text(
                                'CO'.toUpperCase(),
                                style: const TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: AppSizes.bodyText2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSizes.dimen8,
                          ),
                          Text(
                            AppUtils.getAirQualityStatus(
                                state.responseModel.current!.airQuality!.co),
                            style: TextStyle(
                                color: AppUtils.getAirQualityStatusColor(
                                    state.responseModel.current!.airQuality!.co),
                                fontSize: AppSizes.headline6,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: AppSizes.dimen4,
                          ),
                          Text(
                            co,
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.headline5,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: AppSizes.dimen4,
                          ),
                          const Text(
                            '121 μg/m3',
                            style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText1,
                                fontWeight: FontWeight.w400),
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
                                image: AssetImage(AppIcons.airQuality),
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(
                                width: AppSizes.kDefaultPadding,
                              ),
                              Text(
                                'O3'.toUpperCase(),
                                style: const TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: AppSizes.bodyText2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSizes.dimen8,
                          ),
                          Text(
                            AppUtils.getAirQualityStatus(
                                state.responseModel.current!.airQuality!.o3),
                            style: TextStyle(
                                color: AppUtils.getAirQualityStatusColor(
                                    state.responseModel.current!.airQuality!.o3),
                                fontSize: AppSizes.headline6,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: AppSizes.dimen4,
                          ),
                          Text(
                            o3,
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.headline5,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: AppSizes.dimen4,
                          ),
                          const Text(
                            '40 μg/m3',
                            style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText1,
                                fontWeight: FontWeight.w400),
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
                                image: AssetImage(AppIcons.airQuality),
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(
                                width: AppSizes.kDefaultPadding,
                              ),
                              Text(
                                'SO2'.toUpperCase(),
                                style: const TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: AppSizes.bodyText2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSizes.dimen8,
                          ),
                          Text(
                            AppUtils.getAirQualityStatus(
                                state.responseModel.current!.airQuality!.so2),
                            style: TextStyle(
                                color: AppUtils.getAirQualityStatusColor(
                                    state.responseModel.current!.airQuality!.so2),
                                fontSize: AppSizes.headline6,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: AppSizes.dimen4,
                          ),
                          Text(
                            so2,
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.headline5,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: AppSizes.dimen4,
                          ),
                          const Text(
                            '2 μg/m3',
                            style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText1,
                                fontWeight: FontWeight.w400),
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
                                image: AssetImage(AppIcons.airQuality),
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(
                                width: AppSizes.kDefaultPadding,
                              ),
                              Text(
                                'PM2_5'.toUpperCase(),
                                style: const TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: AppSizes.bodyText2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSizes.dimen8,
                          ),
                          Text(
                            AppUtils.getAirQualityStatus(
                                state.responseModel.current!.airQuality!.pm25),
                            style: TextStyle(
                                color: AppUtils.getAirQualityStatusColor(state
                                    .responseModel.current!.airQuality!.pm25),
                                fontSize: AppSizes.headline6,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: AppSizes.dimen4,
                          ),
                          Text(
                            pm2,
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.headline5,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: AppSizes.dimen4,
                          ),
                          const Text(
                            '3 μg/m3',
                            style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText1,
                                fontWeight: FontWeight.w400),
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
                                image: AssetImage(AppIcons.airQuality),
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(
                                width: AppSizes.kDefaultPadding,
                              ),
                              Text(
                                'PM10'.toUpperCase(),
                                style: const TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: AppSizes.bodyText2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSizes.dimen8,
                          ),
                          Text(
                            AppUtils.getAirQualityStatus(
                                state.responseModel.current!.airQuality!.pm10),
                            style: TextStyle(
                                color: AppUtils.getAirQualityStatusColor(state
                                    .responseModel.current!.airQuality!.pm10),
                                fontSize: AppSizes.headline6,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: AppSizes.dimen4,
                          ),
                          Text(
                            pm10,
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.headline5,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: AppSizes.dimen4,
                          ),
                          const Text(
                            '4 μg/m3',
                            style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText1,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.kDefaultPadding),
        ],
      ),
    );
  }
}
