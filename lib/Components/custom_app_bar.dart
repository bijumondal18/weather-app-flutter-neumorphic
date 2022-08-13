import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';
import '../Widgets/neumorphic_card.dart';

class CustomAppBar extends StatelessWidget {
  final WeatherStateLoaded state;

  const CustomAppBar({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
      height: 48,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: const NeumorphicCard(
              isClickable: true,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.dimen12),
                child: Icon(
                  Icons.menu,
                  size: 24,
                ),
              ),
            ),
          ),
          Text(state.responseModel.location!.name.toString(),
              style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: AppSizes.headline6,
                  fontWeight: FontWeight.w400)),
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
