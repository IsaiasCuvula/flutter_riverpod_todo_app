import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    this.child,
    required this.color,
  });
  final Widget? child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          width: 2,
          color: color,
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
