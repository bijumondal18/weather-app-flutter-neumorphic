import 'package:flutter/material.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Utils/app_utils.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';
import '../Widgets/neumorphic_card.dart';

class TemparatureList extends StatelessWidget {
  final WeatherStateLoaded state;

  const TemparatureList({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: AppSizes.kDefaultPadding),
          itemCount: state.responseModel.forecast!.forecastday![0].hour!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  right: AppSizes.kDefaultPadding,
                  top: AppSizes.kDefaultPadding,
                  bottom: AppSizes.kDefaultPadding),
              child: NeumorphicCard(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          AppUtils.getTimeFromDateString(
                              '${state.responseModel.forecast!.forecastday![0].hour![index].time}'),
                          style: const TextStyle(
                              color: AppColors.darkGrey,
                              fontSize: AppSizes.bodyText2,
                              fontWeight: FontWeight.w400),
                        ),
                        Image(
                          image: NetworkImage(
                              'http:${state.responseModel.forecast!.forecastday![0].hour![index].condition!.icon}'),
                          width: 40,
                          height: 40,
                        ),
                        Row(
                          children: [
                            Text(
                              '${state.responseModel.forecast!.forecastday![0].hour![index].tempC}°C',
                              style: const TextStyle(
                                  color: AppColors.darkGrey,
                                  fontSize: AppSizes.bodyText1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
