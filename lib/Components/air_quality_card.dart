import 'package:flutter/material.dart';
import 'package:starter_project/Utils/app_utils.dart';
import 'dart:math';
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
    var airIndex =
        state.responseModel.current!.airQuality!.o3.toStringAsFixed(2);
    return Container(
        margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.20,
        child: NeumorphicCard(
            isClickable: true,
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                airIndex,
                                style: const TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: AppSizes.headline1,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                AppUtils.getAirQualityStatus(state
                                    .responseModel.current!.airQuality!.o3),
                                style: const TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: AppSizes.headline6,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSizes.kDefaultPadding,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppSizes.cardCornerRadius),
                            gradient: const LinearGradient(colors: [
                              AppColors.green,
                              AppColors.yellow,
                              AppColors.orange,
                              AppColors.red
                            ])),
                      ),
                      const SizedBox(
                        height: AppSizes.dimen8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Good',
                            style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText2,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Hazardous',
                            style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText2,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              color: AppColors.transparent,
                              child: Container(
                                padding: const EdgeInsets.all(
                                    AppSizes.kDefaultPadding),
                                decoration: BoxDecoration(
                                    color: AppColors.backgroundColor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16))),
                                child: _AirQualityData(state: state),
                              ),
                            );
                          });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Full air quality forecast',
                          style: TextStyle(
                              color: AppColors.blue,
                              fontSize: AppSizes.bodyText2,
                              fontWeight: FontWeight.w400),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: AppColors.darkGrey,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class _AirQualityData extends StatelessWidget {
  final WeatherStateLoaded state;

  const _AirQualityData({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var no2 = state.responseModel.current!.airQuality!.no2.toStringAsFixed(2);
    var co = state.responseModel.current!.airQuality!.co.toStringAsFixed(2);
    var o3 = state.responseModel.current!.airQuality!.o3.toStringAsFixed(2);
    var so2 = state.responseModel.current!.airQuality!.so2.toStringAsFixed(2);
    var pm2 = state.responseModel.current!.airQuality!.pm25.toStringAsFixed(2);
    var pm10 = state.responseModel.current!.airQuality!.pm10.toStringAsFixed(2);

    return Column(
      children: [
        const SizedBox(height: AppSizes.dimen8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  fontSize: AppSizes.bodyText1,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.kDefaultPadding),
        Row(
          children: [
            Expanded(
              child: NeumorphicCard(
                  isClickable: false,
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
                          height: AppSizes.kDefaultPadding,
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
                  isClickable: false,
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
                          height: AppSizes.kDefaultPadding,
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
                  isClickable: false,
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
                          height: AppSizes.kDefaultPadding,
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
                  isClickable: false,
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
                          height: AppSizes.kDefaultPadding,
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
                  isClickable: false,
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
                          height: AppSizes.kDefaultPadding,
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
                  isClickable: false,
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
                          height: AppSizes.kDefaultPadding,
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
        const SizedBox(height: AppSizes.kDefaultPadding)
      ],
    );
  }
}
