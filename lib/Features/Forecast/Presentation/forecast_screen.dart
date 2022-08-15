import 'package:flutter/material.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Utils/app_utils.dart';
import 'package:starter_project/Widgets/custom_appbar.dart';

import '../../../Commons/commons.dart';
import '../../../Widgets/neumorphic_card.dart';

class ForecastScreen extends StatelessWidget {
  final WeatherStateLoaded state;

  const ForecastScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        state: state,
        title:
            'Next ${state.responseModel.forecast!.forecastday!.length}-days Forecast',
        icon: AppIcons.forecast,
      ),
      body: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemCount: state.responseModel.forecast!.forecastday!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: AppSizes.kDefaultPadding,
                  right: AppSizes.kDefaultPadding,
                  top: AppSizes.kDefaultPadding),
              child: NeumorphicCard(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppUtils.getWeekdayFromDate(index, '${state.responseModel.forecast!.forecastday![index].date}')}\n${AppUtils.getDateFromDateString('${state.responseModel.forecast!.forecastday![index].date}')}',
                        //textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: AppSizes.bodyText2,
                            fontWeight: FontWeight.w400),
                      ),
                      Image(
                        image: NetworkImage(
                            'http:${state.responseModel.forecast!.forecastday![index].day!.condition!.icon}'),
                        width: 40,
                        height: 40,
                      ),
                      Text(
                          '${state.responseModel.forecast!.forecastday![index].day!.mintempC}°C'),
                      Container(
                        height: 4,
                        width: 60,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              AppColors.green,
                              AppColors.yellow,
                              AppColors.orange,
                              AppColors.red,
                            ]),
                            borderRadius:
                                BorderRadius.circular(AppSizes.dimen20)),
                      ),
                      Text(
                          '${state.responseModel.forecast!.forecastday![index].day!.maxtempC}°C'),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
