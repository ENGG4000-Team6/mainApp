import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/pages/second_page.dart'; // Import the file containing your SecondPage widget
import '../lib/widgets/configuring_session.dart';

void main() {
  testWidgets('Signal Acquisition Widget Test', (WidgetTester tester) async {
    // Initialize variables to store the selected channels
    String selectedChannel1 = 'EMG'; // Select EMG for Channel 1
    String selectedChannel2 = 'ECG'; // Select ECG for Channel 2
    String selectedChannel3 = '';     // Channel 3 not selected

    // Mock function for updating selected channels
    void updateSelectedChannels(String channel, String option) {
      if (channel == 'Channel 1') {
        selectedChannel1 = option;
      } else if (channel == 'Channel 2') {
        selectedChannel2 = option;
      } else if (channel == 'Channel 3') {
        selectedChannel3 = option;
      }
    }

    // Build the widget for configuring session
    await tester.pumpWidget(
      MaterialApp(
        home: ConfiguringSession(updateSelectedChannels),
      ),
    );

    // Tap on the checkboxes in ConfiguringSession widget to simulate user interaction
    await tester.tap(find.byType(Checkbox).at(0)); // Channel 1 EMG
    await tester.pump();
    await tester.tap(find.byType(Checkbox).at(1)); // Channel 2 ECG
    await tester.pump();

    // Build the widget for SecondPage using the selected channels
    await tester.pumpWidget(
      MaterialApp(
        home: SecondPage({
          'Channel 1': selectedChannel1,
          'Channel 2': selectedChannel2,
          'Channel 3': selectedChannel3,
        }),
      ),
    );

    // Verify that the plots for selected channels are displayed
    expect(find.text('Channel 1'), findsOneWidget);
    expect(find.text('Channel 2'), findsOneWidget);
    expect(find.text('Channel 3'), findsNothing); // Channel 3 not selected
  });
}