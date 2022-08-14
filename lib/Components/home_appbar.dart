import 'package:flutter/material.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Features/ManageCities/Presentation/manage_city_screen.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';
import '../Widgets/neumorphic_card.dart';

class HomeAppBar extends StatelessWidget {
  final WeatherStateLoaded state;

  const HomeAppBar({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
      height: 48,
      width: MediaQuery.of(context).size.width,
      color: AppColors.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ManageCitiesScreen()));
            },
            child: const NeumorphicCard(
              isClickable: true,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.dimen12),
                child: Icon(
                  Icons.add,
                  size: 24,
                ),
              ),
            ),
          ),
          Text(
              '${state.responseModel.location!.name}\n${state.responseModel.location!.region} ${state.responseModel.location!.country}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: AppSizes.headline6,
                  fontWeight: FontWeight.w500)),
          InkWell(
            onTap: () {},
            child: const NeumorphicCard(
              isClickable: true,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.dimen12),
                child: Icon(
                  Icons.more_vert_rounded,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
