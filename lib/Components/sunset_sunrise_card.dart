import 'package:flutter/material.dart';
import 'package:starter_project/Widgets/neumorphic_card.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';
import '../Features/Home/Bloc/weather_bloc.dart';

class SunsetSunriseCard extends StatelessWidget {
  final WeatherStateLoaded state;

  const SunsetSunriseCard({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.10,
      child: NeumorphicCard(
        isClickable: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.responseModel.forecast!.forecastday![0].astro!.sunrise}',
                    style: const TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: AppSizes.bodyText1,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    'Sunrise',
                    style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: AppSizes.bodyText2,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const Expanded(child: CurvedContainer()),
            Padding(
              padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.responseModel.forecast!.forecastday![0].astro!.sunset}',
                    style: const TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: AppSizes.bodyText1,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    'Sunset',
                    style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: AppSizes.bodyText2,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvePainter(),
      child: Container(),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = AppColors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    var startPoint = Offset(0, size.height - 25);
    var controlPoint1 = Offset(size.width / 4, size.height / 3);
    var controlPoint2 = Offset(3 * size.width / 4, size.height / 3);
    var endPoint = Offset(size.width, size.height - 25);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
