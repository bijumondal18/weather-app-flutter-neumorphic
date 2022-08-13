import 'package:flutter/material.dart';

import 'commons.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: AppColors.generateMaterialColor(AppColors.primary),
      dividerColor: AppColors.grey,
      brightness: Brightness.light,
      backgroundColor: AppColors.white,
      cardColor: AppColors.white,
      primaryColor: AppColors.primary,
      hintColor: AppColors.darkGrey,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: AppSizes.elevation5, backgroundColor: AppColors.primary),
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            size: AppSizes.appBarIconSize,
            color: AppColors.darkGrey,
          ),
          backgroundColor: AppColors.backgroundColor,
          elevation: AppSizes.elevation0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: AppColors.darkGrey,
            fontSize: AppSizes.headline6,
            fontWeight: FontWeight.w600,
            // fontFamily: FontFamily.sourceSansProRegular
          ),
          foregroundColor: AppColors.black),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.grey,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors.primary)),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: AppColors.black,
            fontSize: AppSizes.headline1,
            fontWeight: FontWeight.w900),
        headline2: TextStyle(
            color: AppColors.black,
            fontSize: AppSizes.headline2,
            fontWeight: FontWeight.w700),
        headline3: TextStyle(
            color: AppColors.black,
            fontSize: AppSizes.headline3,
            fontWeight: FontWeight.w700),
        headline4: TextStyle(
            color: AppColors.black,
            fontSize: AppSizes.headline4,
            fontWeight: FontWeight.w700),
        headline5: TextStyle(
            color: AppColors.black,
            fontSize: AppSizes.headline5,
            fontWeight: FontWeight.w600),
        headline6: TextStyle(
            color: AppColors.darkGrey,
            fontSize: AppSizes.headline6,
            fontWeight: FontWeight.w600),
        bodyText1: TextStyle(
            color: AppColors.black,
            fontSize: AppSizes.bodyText1,
            fontWeight: FontWeight.w500),
        bodyText2: TextStyle(
            color: AppColors.black,
            fontSize: AppSizes.bodyText2,
            fontWeight: FontWeight.w400),
        caption: TextStyle(
            color: AppColors.darkGrey,
            fontSize: AppSizes.caption,
            fontWeight: FontWeight.w400),
        button: TextStyle(
            color: AppColors.white,
            fontSize: AppSizes.button,
            fontWeight: FontWeight.w600),
      ),
      // fontFamily: FontFamily.sourceSansProRegular,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: false,
      primarySwatch: AppColors.generateMaterialColor(AppColors.primary),
      dividerColor: AppColors.grey,
      brightness: Brightness.dark,
      backgroundColor: AppColors.black,
      cardColor: AppColors.white,
      primaryColor: AppColors.primary,
      hintColor: AppColors.darkGrey,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: AppSizes.elevation5, backgroundColor: AppColors.primary),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            size: AppSizes.appBarIconSize,
            color: AppColors.white,
          ),
          backgroundColor: AppColors.black,
          elevation: AppSizes.elevation0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: AppSizes.headline6,
            fontWeight: FontWeight.w600,
            // fontFamily: FontFamily.sourceSansProRegular
          ),
          foregroundColor: AppColors.white),
      scaffoldBackgroundColor: AppColors.scaffoldDark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.grey,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors.primary)),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: AppColors.white,
            fontSize: AppSizes.headline1,
            fontWeight: FontWeight.w900),
        headline2: TextStyle(
            color: AppColors.white,
            fontSize: AppSizes.headline2,
            fontWeight: FontWeight.w700),
        headline3: TextStyle(
            color: AppColors.white,
            fontSize: AppSizes.headline3,
            fontWeight: FontWeight.w700),
        headline4: TextStyle(
            color: AppColors.white,
            fontSize: AppSizes.headline4,
            fontWeight: FontWeight.w700),
        headline5: TextStyle(
            color: AppColors.white,
            fontSize: AppSizes.headline5,
            fontWeight: FontWeight.w600),
        headline6: TextStyle(
            color: AppColors.white,
            fontSize: AppSizes.headline6,
            fontWeight: FontWeight.w600),
        bodyText1: TextStyle(
            color: AppColors.white,
            fontSize: AppSizes.bodyText1,
            fontWeight: FontWeight.w500),
        bodyText2: TextStyle(
            color: AppColors.white,
            fontSize: AppSizes.bodyText2,
            fontWeight: FontWeight.w400),
        caption: TextStyle(
            color: AppColors.white,
            fontSize: AppSizes.caption,
            fontWeight: FontWeight.w400),
        button: TextStyle(
            color: AppColors.white,
            fontSize: AppSizes.button,
            fontWeight: FontWeight.w600),
      ),
      // fontFamily: FontFamily.sourceSansProRegular,
    );
  }
}
