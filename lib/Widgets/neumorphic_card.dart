import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';

class NeumorphicCard extends StatefulWidget {
  final Widget child;

  const NeumorphicCard({Key? key, required this.child}) : super(key: key);

  @override
  State<NeumorphicCard> createState() => _NeumorphicCardState();
}

class _NeumorphicCardState extends State<NeumorphicCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Offset? distance = _isPressed ? const Offset(2, 2) : const Offset(6, 6);
    double blur = _isPressed ? 5 : 15;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.cardCornerRadius),
          color: AppColors.backgroundColor,
          boxShadow: [
            //bottom shadow
            BoxShadow(
                color: Colors.grey.shade400,
                offset: distance,
                blurRadius: blur,
                spreadRadius: 1,
                inset: _isPressed),
            //top shadow
            BoxShadow(
                color: AppColors.white.withOpacity(0.8),
                offset: -distance,
                blurRadius: blur,
                spreadRadius: 1,
                inset: _isPressed),
          ]),
      child: widget.child,
    );
  }
}
