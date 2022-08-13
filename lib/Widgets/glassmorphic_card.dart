import 'dart:ui';

import 'package:flutter/material.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';

class GlassmorphicCard extends StatelessWidget {
  final Widget child;

  const GlassmorphicCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.cardCornerRadius),
            color: AppColors.white.withOpacity(0.25),
            border:
                Border.all(width: 1, color: AppColors.white.withOpacity(0.34))),
        child: child,
      ),
    );
  }
}
