import 'package:flutter/material.dart';
import 'package:starter_project/Widgets/neumorphic_button.dart';

import '../Commons/commons.dart';
import '../Features/Home/Bloc/weather_bloc.dart';
import 'neumorphic_card.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final WeatherStateLoaded state;
  final String? title;
  final String? icon;

  const CustomAppBar({Key? key, required this.state, this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
        width: MediaQuery.of(context).size.width,
        color: AppColors.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NeumorphicButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(AppSizes.dimen12),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: AppSizes.appBarIconSize,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(icon.toString()),
                  width: 18,
                  height: 18,
                ),
                const SizedBox(
                  width: AppSizes.kDefaultPadding,
                ),
                Text(
                  title.toString(),
                  style: const TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: AppSizes.bodyText1,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(AppSizes.dimen12),
              child: Icon(
                Icons.more_vert_rounded,
                size: 24,
                color: AppColors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
