import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/widgets/status_bar.dart'; // Import the file containing your StatusBar widget

void main() {
  testWidgets('StatusBar Widget Test', (WidgetTester tester) async {
    // Define the selected channels
    final Map<String, String> selectedChannels = {
      'Channel 1': 'EMG',
      'Channel 2': 'ECG',
      'Channel 3': 'EOG',
    };

    // Build the StatusBar widget
    await tester.pumpWidget(
      MaterialApp(
        home: StatusBar(selectedChannels: selectedChannels),
      ),
    );

    // Verify that the active sensors text is displayed correctly
    expect(find.text('Active Sensors: EMG, ECG, EOG'), findsOneWidget);
  });
}