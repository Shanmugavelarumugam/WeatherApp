import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/widgets/parallax_background.dart';
import '../weather_provider.dart';
import '../data/cities.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.lightGreen[100],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  final input = textEditingValue.text.toLowerCase();
                  if (input.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return cities
                      .where((city) => city.toLowerCase().contains(input));
                },
                onSelected: (String selectedCity) async {
                  _cityController.text = selectedCity;
                  try {
                    await weatherProvider.fetchWeather(selectedCity);
                    setState(() {
                      _errorMessage = '';
                    });
                  } catch (e) {
                    setState(() {
                      _errorMessage = 'Failed to fetch weather data';
                    });
                  }
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController controller,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      hintText: 'Enter city name',
                      errorText:
                          _errorMessage.isNotEmpty ? _errorMessage : null,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: weatherProvider.weatherCondition.isEmpty
                  ? Center(child: Text('Enter a city to get the weather'))
                  : weatherProvider.weatherCondition.isNotEmpty
                      ? Center(
                          child: ParallaxBackground(
                            weatherCondition: weatherProvider.weatherCondition,
                          ),
                        )
                      : Center(
                          child: Text(
                            'Weather: ${weatherProvider.weatherCondition}',
                          ),
                        ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${weatherProvider.temperature.toStringAsFixed(1)}°C',
                      style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'City: ${_cityController.text}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
