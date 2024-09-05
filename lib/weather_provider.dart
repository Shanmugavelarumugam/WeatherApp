import 'package:flutter/material.dart';
import 'weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  String _weatherCondition = 'Sunny';
  double _temperature = 0.0; // Temperature property
  final WeatherService _weatherService = WeatherService();

  String get weatherCondition => _weatherCondition;
  double get temperature => _temperature; // Getter for temperature

  void setWeatherCondition(String condition) {
    _weatherCondition = condition;
    notifyListeners();
  }

  void setTemperature(double temp) {
    _temperature = temp;
    notifyListeners();
  }

  Future<void> fetchWeather(String city) async {
    try {
      final weatherData = await _weatherService.fetchWeather(city);
      final condition = weatherData['weather'][0]['main'];
      final temp = weatherData['main']['temp']; // Extract temperature

      switch (condition) {
        case 'Rain':
          setWeatherCondition('Rain');
          break;
        case 'Clouds':
          setWeatherCondition('Cloudy');
          break;
        case 'Clear':
          setWeatherCondition('Sunny');
          break;
        case 'Snow':
          setWeatherCondition('Snow');
          break;
        case 'Thunderstorm':
          setWeatherCondition('Thunderstorm');
          break;
        case 'Drizzle':
          setWeatherCondition('Drizzle');
          break;
        default:
          setWeatherCondition('Sunny');
          break;
      }

      setTemperature(temp); // Update temperature
    } catch (e) {
      print('Error fetching weather: $e');
      setWeatherCondition('Sunny'); // Fallback condition
      setTemperature(0.0); // Fallback temperature
    }
  }
}
