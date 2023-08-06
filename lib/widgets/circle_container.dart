import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    this.child,
    required this.color,
    this.borderWidth,
    this.borderColor,
  });
  final Widget? child;
  final Color color;
  final double? borderWidth;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          width: borderWidth ?? 2,
          color: color,
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
