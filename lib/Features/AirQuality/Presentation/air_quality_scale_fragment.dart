import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../Commons/app_colors.dart';
import '../../../Commons/app_sizes.dart';
import '../../../Widgets/neumorphic_card.dart';
import '../Model/air_quality_scale_model.dart';

class AirQualityScaleFragment extends StatelessWidget {
  const AirQualityScaleFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
        itemCount: airQualityScaleList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.kDefaultPadding),
            child: NeumorphicCard(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppSizes.cardCornerRadius),
                                  color: airQualityScaleList[index].color),
                            ),
                            const SizedBox(
                              height: AppSizes.dimen4,
                            ),
                            Text(
                              airQualityScaleList[index].status,
                              style: const TextStyle(
                                  color: AppColors.darkGrey,
                                  fontSize: AppSizes.headline6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          airQualityScaleList[index].range,
                          style: const TextStyle(
                              color: AppColors.darkGrey,
                              fontSize: AppSizes.headline5,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.dimen8,
                    ),
                    ReadMoreText(
                      airQualityScaleList[index].desc,
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      colorClickableText: AppColors.blue,
                      style: const TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: AppSizes.bodyText2,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
