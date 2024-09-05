import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/main.dart';

void main() {
  testWidgets('Weather app widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp()); // Replace with the correct widget name

    // Verify that the initial UI is correct (modify according to your app's actual initial state).
    expect(find.text('Enter city name'), findsOneWidget);

    // Enter text in the TextField.
    await tester.enterText(find.byType(TextField), 'London');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Verify that some expected UI changes occur after interaction.
    expect(find.text('London'), findsOneWidget);
  });
}
