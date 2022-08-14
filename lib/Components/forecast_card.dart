import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starter_project/Features/Forecast/Presentation/forecast_screen.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Utils/app_utils.dart';

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
      height: MediaQuery.of(context).size.height * 0.23,
      child: NeumorphicCard(
        isClickable: false,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 4),
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
                        '${AppUtils.getWeekdayFromDate(index, state.responseModel.forecast!.forecastday![index].date.toString())} \u2022 ${state.responseModel.forecast!.forecastday![index].day!.condition!.text}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForecastScreen(state: state)));
                },
                child: Text(
                  'Next ${state.responseModel.forecast!.forecastday!.length}-days forecast',
                  style: const TextStyle(
                      color: AppColors.blue,
                      fontSize: AppSizes.bodyText2,
                      fontWeight: FontWeight.w500),
                ))
          ],
        ),
      ),
    );
  }
}
