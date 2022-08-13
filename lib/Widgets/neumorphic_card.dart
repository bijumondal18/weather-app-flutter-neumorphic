import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';

class NeumorphicCard extends StatefulWidget {
  final Widget child;
  final bool? isClickable;

  const NeumorphicCard({Key? key, required this.child, this.isClickable})
      : super(key: key);

  @override
  State<NeumorphicCard> createState() => _NeumorphicCardState();
}

class _NeumorphicCardState extends State<NeumorphicCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Offset? distance = _isPressed ? const Offset(4, 4) : const Offset(10, 10);
    double blur = _isPressed ? 5 : 20;
    return Listener(
      onPointerUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onPointerDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
//        padding: const EdgeInsets.all(AppSizes.dimen12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.cardCornerRadius),
            color: AppColors.backgroundColor,
            boxShadow: widget.isClickable!
                ? [
                    //bottom shadow
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: distance,
                        blurRadius: blur,
                        spreadRadius: 1,
                        inset: _isPressed),
                    //top shadow
                    BoxShadow(
                        color: Colors.white,
                        offset: -distance,
                        blurRadius: blur,
                        spreadRadius: 1,
                        inset: _isPressed),
                  ]
                : [
                    //bottom shadow
                    BoxShadow(
                      color: Colors.grey.shade500,
                      offset: distance,
                      blurRadius: blur,
                      spreadRadius: 1,
                    ),
                    //top shadow
                    BoxShadow(
                      color: Colors.white,
                      offset: -distance,
                      blurRadius: blur,
                      spreadRadius: 1,
                    ),
                  ]),
        child: widget.child,
      ),
    );
  }
}
