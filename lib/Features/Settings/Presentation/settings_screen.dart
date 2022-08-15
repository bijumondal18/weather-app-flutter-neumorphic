import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:starter_project/Commons/commons.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Widgets/custom_appbar.dart';
import 'package:starter_project/Widgets/neumorphic_button.dart';
import 'package:starter_project/Widgets/neumorphic_card.dart';

class SettingsScreen extends StatelessWidget {
  final WeatherStateLoaded state;

  const SettingsScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        state: state,
        title: 'Settings',
        icon: AppIcons.settings,
      ),
      body: const _BuildBody(),
    );
  }
}

class _BuildBody extends StatefulWidget {
  const _BuildBody({Key? key}) : super(key: key);

  @override
  State<_BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<_BuildBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Units',
              style: TextStyle(
                  fontSize: AppSizes.bodyText1,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey),
            ),
            const SizedBox(height: AppSizes.kDefaultPadding),
            Column(
              children: [
                NeumorphicButton(
                  onPressed: () {},
                  child: const ListTile(
                    title: Text(
                      'Temperature Units',
                      style: TextStyle(
                          fontSize: AppSizes.bodyText1,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey),
                    ),
                    trailing: Text('°C'),
                  ),
                ),
                const SizedBox(height: AppSizes.kDefaultPadding),
                NeumorphicButton(
                  onPressed: () {},
                  child: const ListTile(
                    title: Text(
                      'Wind Speed Units',
                      style: TextStyle(
                          fontSize: AppSizes.bodyText1,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey),
                    ),
                    trailing: Text('Kilometers/Hour (km/h)'),
                  ),
                ),
                const SizedBox(height: AppSizes.kDefaultPadding),
                NeumorphicButton(
                  onPressed: () {},
                  child: const ListTile(
                    title: Text(
                      'Atmospheric Pressure Units',
                      style: TextStyle(
                          fontSize: AppSizes.bodyText1,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey),
                    ),
                    trailing: Text('Millibar (mBar)'),
                  ),
                )
              ],
            ),
            const SizedBox(height: AppSizes.kDefaultPadding),
            const Text(
              'About Weather',
              style: TextStyle(
                  fontSize: AppSizes.bodyText1,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGrey),
            ),
            const SizedBox(height: AppSizes.kDefaultPadding),
            Column(
              children: [
                NeumorphicButton(
                  onPressed: () {},
                  child: const ListTile(
                    title: Text(
                      'Feedback',
                      style: TextStyle(
                          fontSize: AppSizes.bodyText1,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.grey,
                      size: AppSizes.appBarIconSize,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.kDefaultPadding),
                NeumorphicButton(
                  onPressed: () {},
                  child: const ListTile(
                    title: Text(
                      'Privacy Policy',
                      style: TextStyle(
                          fontSize: AppSizes.bodyText1,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.grey,
                      size: AppSizes.appBarIconSize,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.kDefaultPadding),
                NeumorphicButton(
                  onPressed: () {},
                  child: const ListTile(
                    title: Text(
                      'About',
                      style: TextStyle(
                          fontSize: AppSizes.bodyText1,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.grey,
                      size: AppSizes.appBarIconSize,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.dimen30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'App Version : 1.0.3',
                  style: TextStyle(
                      fontSize: AppSizes.bodyText2,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
