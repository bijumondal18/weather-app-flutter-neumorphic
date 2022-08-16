import 'package:flutter/material.dart';
import 'package:starter_project/Features/AirQuality/Presentation/air_quality_screen.dart';
import 'package:starter_project/Utils/app_utils.dart';
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
        state.responseModel.current!.airQuality!.gbDefraIndex.toStringAsFixed(2);
    return Container(
        margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.22,
        child: NeumorphicCard(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
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
                                      .responseModel.current!.airQuality!.gbDefraIndex),
                                  style:  TextStyle(
                                      color: AppUtils.getAirQualityStatusColor(state
                                          .responseModel.current!.airQuality!.gbDefraIndex),
                                      fontSize: AppSizes.headline6,
                                      fontWeight: FontWeight.w700),
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
                                AppColors.red,
                              ])),
                        ),
                        const SizedBox(
                          height: AppSizes.dimen8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Low',
                              style: TextStyle(
                                  color: AppColors.darkGrey,
                                  fontSize: AppSizes.bodyText2,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Very High',
                              style: TextStyle(
                                  color: AppColors.darkGrey,
                                  fontSize: AppSizes.bodyText2,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                   const SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AirQualityScreen(state: state)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Full Air Quality Forecast',
                          style: TextStyle(
                              color: AppColors.blue,
                              fontSize: AppSizes.bodyText2,
                              fontWeight: FontWeight.w600),
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

