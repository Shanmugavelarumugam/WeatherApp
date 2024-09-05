import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/weather_provider.dart';

void main() {
  test('WeatherProvider should return correct temperature', () {
    final weatherProvider = WeatherProvider();
    weatherProvider.setTemperature(25.5);

    expect(weatherProvider.temperature, 25.5);
  });
}
