import 'package:flutter/material.dart';

class AppContainerWidget extends StatelessWidget {
  const AppContainerWidget({
    super.key,
    this.margin,
    this.padding,
    this.boxShadow,
    this.borderRadius = 10,
    this.color = const Color(0xFFfeefe4),
    required this.child,
  });

  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Color color;
  final Widget child;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 3,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.16),
              ),
            ],
      ),
      child: child,
    );
  }
}
