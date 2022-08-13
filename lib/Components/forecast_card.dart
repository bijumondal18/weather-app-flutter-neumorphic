import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starter_project/Features/Forecast/Presentation/forecast_screen.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';
import '../Widgets/neumorphic_card.dart';

class ForecastCard extends StatelessWidget {
  final WeatherStateLoaded state;

  const ForecastCard({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: NeumorphicCard(
        isClickable: false,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.dimen12),
                child: ListView.builder(
                    itemCount:
                        state.responseModel.forecast!.forecastday!.length > 3
                            ? 3
                            : state.responseModel.forecast!.forecastday!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        horizontalTitleGap: 0,
                        dense: true,
                        leading: Image(
                          image: NetworkImage(
                              'http:${state.responseModel.forecast!.forecastday![index].day!.condition!.icon}'),
                          width: 28,
                          height: 28,
                        ),
                        title: Text(
                          '${state.responseModel.forecast!.forecastday![index].day!.condition!.text}',
                          style: const TextStyle(
                              color: AppColors.darkGrey,
                              fontSize: AppSizes.bodyText1,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: FittedBox(
                          child: Text(
                            '${state.responseModel.forecast!.forecastday![index].day!.maxtempC}°C / ${state.responseModel.forecast!.forecastday![index].day!.mintempC}°C',
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: AppSizes.bodyText2,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForecastScreen()));
                },
                child: const Text(
                  '5-day forecast',
                  style: TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: AppSizes.bodyText2,
                      fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
    );
  }
}
