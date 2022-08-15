import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';

class NeumorphicButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const NeumorphicButton({Key? key, required this.child, required this.onPressed}) : super(key: key);

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Offset? distance = _isPressed ? const Offset(2, 2) : const Offset(5, 5);
    double blur = _isPressed ? 5 : 15;
    return GestureDetector(
      onTap: widget.onPressed,
      child: Listener(
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
        ),
      ),
    );
  }
}
