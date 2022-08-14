import 'package:flutter/material.dart';
import 'package:starter_project/Commons/commons.dart';

class AirQualityScale {
  final String status;
  final String desc;
  final String range;
  final Color color;

  AirQualityScale(this.status, this.desc, this.range, this.color);
}

final List<AirQualityScale> airQualityScaleList = [
  AirQualityScale(
      'Excellent',
      'The air quality is ideal for most individuals. Enjoy your normal outdoor activities.',
      '0 - 19',
      AppColors.green),
  AirQualityScale(
      'Fair',
      'The air quality is generally acceptable for most individuals. However,sensitive groups may experience some minor to moderate symptoms from long-term exposure.',
      '20 - 49',
      AppColors.yellow),
  AirQualityScale(
      'Poor',
      'The air has reached a high level of pollution and its unhealthy for sensitive groups. Reduce time spent outside if you are feeling symptoms such as difficulty breathing or throat irritation.',
      '50 - 99',
      AppColors.orange),
  AirQualityScale(
      'Unhealthy',
      'Health effects can be immediately felt by sensitive groups. Healthy individuals may experience difficulty breathing or throat irritation with prolonged exposure. Limit outdoor activity.',
      '100 - 149',
      AppColors.red),
  AirQualityScale(
      'Very Unhealthy',
      'Health effects will be immediately felt by sensitive groups and should avoid outdoor activity. Healthy individuals are likely to experience difficulty breathing and throat irritation; consider staying indoors and rescheduling outdoor activities.',
      '150 - 249',
      AppColors.pink),
  AirQualityScale(
      'Dangerous',
      'Any exposure to the air, even for a few minutes, can lead to serious health effects on everybody. Avoid outdoor activities.',
      '250+',
      AppColors.purple),
];
