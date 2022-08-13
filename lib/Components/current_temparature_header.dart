import 'package:flutter/material.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Widgets/neumorphic_card.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';

class CurrentTemparatureHeader extends StatelessWidget {
  final WeatherStateLoaded state;

  const CurrentTemparatureHeader({Key? key, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                    '${state.responseModel.current!.tempC}° ${state.responseModel.current!.condition!.text}',
                    style: const TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: AppSizes.headline3,
                        fontWeight: FontWeight.w500)),
              ),
              Image(
                image: NetworkImage(
                    'http:${state.responseModel.current!.condition!.icon}'),
              )
            ],
          ),
          // NeumorphicCard(
          //   isClickable: true,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(
          //         horizontal: AppSizes.kDefaultPadding,
          //         vertical: AppSizes.dimen8),
          //     child: Text(
          //         'AQI ${state.responseModel.current!.airQuality!.gbDefraIndex}',
          //         style: const TextStyle(
          //             color: AppColors.darkGrey,
          //             fontSize: AppSizes.bodyText2,
          //             fontWeight: FontWeight.w400)),
          //   ),
          // )
        ],
      ),
    );
  }
}
