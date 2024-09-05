import 'package:flutter/material.dart';

class WeatherTransition extends StatelessWidget {
  final Widget child;
  final String weatherCondition;

  const WeatherTransition(
      {required this.child, required this.weatherCondition});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 2),
      child: child,
    );
  }
}
