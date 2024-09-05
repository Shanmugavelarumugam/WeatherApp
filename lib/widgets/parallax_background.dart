import 'package:flutter/material.dart';
import 'sun_animation.dart';
import 'cloud_animation.dart';
import 'rain_animation.dart';
import 'moon_animation.dart';
import 'star_animation.dart';

class ParallaxBackground extends StatelessWidget {
  final String weatherCondition;

  const ParallaxBackground({required this.weatherCondition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (weatherCondition == 'Night') StarAnimation(),
        if (weatherCondition == 'Rain') RainAnimation(),
        if (weatherCondition == 'Cloudy') CloudAnimation(),
        if (weatherCondition == 'Sunny') SunAnimation(),
        if (weatherCondition == 'Night') MoonAnimation(),
        // Add more conditions as needed
      ],
    );
  }
}
