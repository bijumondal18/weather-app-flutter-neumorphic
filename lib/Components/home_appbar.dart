import 'package:flutter/material.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Features/Search/Presentation/search_screen.dart';
import 'package:starter_project/Widgets/neumorphic_button.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';
import '../Features/Settings/Presentation/settings_screen.dart';
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
          NeumorphicButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.all(AppSizes.dimen12),
              child: Icon(
                Icons.add,
                size: AppSizes.appBarIconSize,
              ),
            ),
          ),
          Column(
            children: [
              Text('${state.responseModel.location!.name}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: AppSizes.headline6,
                      fontWeight: FontWeight.w500)),
              Text(
                  '${state.responseModel.location!.region}, ${state.responseModel.location!.country}',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: AppSizes.bodyText2,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          NeumorphicButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsScreen(state: state)));
            },
            child: const Padding(
              padding: EdgeInsets.all(AppSizes.dimen12),
              child: Icon(
                Icons.more_vert_rounded,
                size: AppSizes.appBarIconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void handleClick(String value) {
  switch (value) {
    case 'Share':
      break;
    case 'Settings':
      break;
  }
}
