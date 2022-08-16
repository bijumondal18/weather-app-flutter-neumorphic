import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_project/Commons/commons.dart';
import 'package:starter_project/Commons/constants.dart';
import 'package:starter_project/Features/Home/Bloc/weather_bloc.dart';
import 'package:starter_project/Features/PrivacyPolicy/Presentation/privacy_policy_screen.dart';
import 'package:starter_project/Features/Search/Bloc/searched_location_bloc.dart';
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
        onBackPressed: () {
          BlocProvider.of<WeatherBloc>(context).add(GetWeatherDataEvent());
          Navigator.pop(context);
        },
      ),
      body: _BuildBody(state: state),
    );
  }
}

class _BuildBody extends StatefulWidget {
  final WeatherStateLoaded state;

  const _BuildBody({Key? key, required this.state}) : super(key: key);

  @override
  State<_BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<_BuildBody> {
  final List<String> tempUnitList = [
    '°C',
    '°F',
  ];

  final List<String> windSpeedUnitList = [
    'Kilometers per hour (km/h)',
    'Miles per hour (mph)',
  ];

  final List<String> atmosphericPressureUnitList = [
    'Millibar (mBar)',
    'Inch of mercury (inHg)',
  ];

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
                  child: ListTile(
                    title: const Text(
                      'Temperature Units',
                      style: TextStyle(
                          fontSize: AppSizes.bodyText1,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey),
                    ),
                    trailing: DropdownButton<String>(
                        underline: Container(),
                        icon: const Image(
                          image: AssetImage(AppIcons.arrowUpDown),
                          width: 16,
                          height: 16,
                        ),
                        alignment: AlignmentDirectional.centerEnd,
                        dropdownColor: AppColors.backgroundColor,
                        elevation: 1,
                        borderRadius:
                            BorderRadius.circular(AppSizes.cardCornerRadius),
                        value: Constants.selectedTempUnit,
                        onChanged: (value) {
                          setState(() {
                            Constants.selectedTempUnit = value!;
                          });
                        },
                        items: tempUnitList.map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontSize: AppSizes.bodyText1,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.darkGrey),
                                ));
                          },
                        ).toList()),
                  ),
                ),
                const SizedBox(height: AppSizes.kDefaultPadding),
                NeumorphicButton(
                  onPressed: () {},
                  child: ListTile(
                    title: const Text(
                      'Wind Speed Units',
                      style: TextStyle(
                          fontSize: AppSizes.bodyText1,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey),
                    ),
                    trailing: DropdownButton<String>(
                        underline: Container(),
                        icon: const Image(
                          image: AssetImage(AppIcons.arrowUpDown),
                          width: 16,
                          height: 16,
                        ),
                        alignment: AlignmentDirectional.centerEnd,
                        dropdownColor: AppColors.backgroundColor,
                        elevation: 1,
                        borderRadius:
                            BorderRadius.circular(AppSizes.cardCornerRadius),
                        value: Constants.selectedWindSpeedUnit,
                        onChanged: (value) {
                          setState(() {
                            Constants.selectedWindSpeedUnit = value!;
                          });
                        },
                        items: windSpeedUnitList.map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontSize: AppSizes.bodyText1,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.darkGrey),
                                ));
                          },
                        ).toList()),
                  ),
                ),
                const SizedBox(height: AppSizes.kDefaultPadding),
                NeumorphicButton(
                  onPressed: () {},
                  child: ListTile(
                    title: const Text(
                      'Atmospheric Pressure Units',
                      style: TextStyle(
                          fontSize: AppSizes.bodyText1,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey),
                    ),
                    trailing: DropdownButton<String>(
                        underline: Container(),
                        icon: const Image(
                          image: AssetImage(AppIcons.arrowUpDown),
                          width: 16,
                          height: 16,
                        ),
                        alignment: AlignmentDirectional.centerEnd,
                        dropdownColor: AppColors.backgroundColor,
                        elevation: 1,
                        borderRadius:
                            BorderRadius.circular(AppSizes.cardCornerRadius),
                        value: Constants.selectedAtmosphericPressureUnit,
                        onChanged: (value) {
                          setState(() {
                            Constants.selectedAtmosphericPressureUnit = value!;
                          });
                        },
                        items: atmosphericPressureUnitList
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontSize: AppSizes.bodyText1,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.darkGrey),
                                ));
                          },
                        ).toList()),
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
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             PrivacyPolicyScreen(state: widget.state)));
                  },
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

Widget neumorphicSwitch() {
  return Container(
    width: 100,
    height: 40,
    decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(AppSizes.dimen30)),
    child: Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(AppSizes.dimen30)),
            )),
        Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(AppSizes.dimen30)),
            )),
      ],
    ),
  );
}
