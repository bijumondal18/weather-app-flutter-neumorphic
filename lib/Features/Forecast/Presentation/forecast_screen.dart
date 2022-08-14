import 'package:flutter/material.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Utils/app_utils.dart';

import '../../../Commons/commons.dart';
import '../../../Widgets/neumorphic_card.dart';

class ForecastScreen extends StatelessWidget {
  final WeatherStateLoaded state;

  const ForecastScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Container(
              margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
              height: 48,
              width: MediaQuery.of(context).size.width,
              color: AppColors.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const NeumorphicCard(
                      isClickable: true,
                      child: Padding(
                        padding: EdgeInsets.all(AppSizes.dimen12),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Text(
                      'Next ${state.responseModel.forecast!.forecastday!.length}-days forecast',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: AppSizes.headline6,
                          fontWeight: FontWeight.w500)),
                  InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(AppSizes.dimen12),
                      child: Icon(
                        Icons.more_vert_rounded,
                        size: 24,
                        color: AppColors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.responseModel.forecast!.forecastday!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
                    child: NeumorphicCard(
                      isClickable: false,
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
                              height: 25,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: AppColors.red,
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
          )
        ],
      ),
    );
  }
}
