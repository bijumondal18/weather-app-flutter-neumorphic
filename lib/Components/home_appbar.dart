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
    final List<String> choiceList = [
      'Share',
      'Rate Us',
      'Settings',
    ];

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
                      builder: (context) => ManageCitiesScreen(
                            state: state,
                          )));
            },
            child: const NeumorphicCard(
              isClickable: true,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.dimen12),
                child: Icon(
                  Icons.add,
                  size: AppSizes.appBarIconSize,
                ),
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
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView.builder(
                        itemCount: choiceList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(choiceList[index]),
                          );
                        });
                  });
            },
            child: const NeumorphicCard(
              isClickable: true,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.dimen12),
                child: Icon(
                  Icons.more_vert_rounded,
                  size: AppSizes.appBarIconSize,
                ),
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
