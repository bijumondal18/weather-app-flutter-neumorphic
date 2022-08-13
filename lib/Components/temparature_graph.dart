import 'dart:math';

import 'package:flutter/material.dart';
import 'package:starter_project/Commons/commons.dart';
import 'package:starter_project/Widgets/neumorphic_card.dart';

import '../Commons/app_sizes.dart';

final data = [55.0, 90.0, 40.0, 55.0, 75.0, 65.0, 55.0, 100.0];

class TemparatureGraph extends StatelessWidget {
  const TemparatureGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: NeumorphicCard(
        isClickable: false,
        child: Column(
          children: [
            const SizedBox(height: AppSizes.dimen30),
            Chart(
              data: data,
            ),
          ],
        ),
      ),
    );
  }
}

class Chart extends StatelessWidget {
  final List<double> data;

  const Chart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ClipPath(
      clipper: ChartClipper(data: data, maxValue: data.reduce(max)),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppSizes.cardCornerRadius)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.orange,
                  AppColors.red,
                  AppColors.youtube,
                ])),
      ),
    ));
  }
}

class ChartClipper extends CustomClipper<Path> {
  final List<double> data;
  final double maxValue;

  ChartClipper({required this.data, required this.maxValue});

  @override
  Path getClip(Size size) {
    double sectionWidth = size.width / (data.length - 1);
    Path path = Path();
    path.moveTo(0, size.width);

    for (int i = 0; i < data.length; i++) {
      path.lineTo(
          i * sectionWidth, size.height - size.height * (data[i] / maxValue));
    }
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
