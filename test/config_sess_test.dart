import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/widgets/configuring_session.dart'; // Import the file containing your ConfiguringSession widget

void main() {
  testWidgets('Configuring Session Widget Test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: ConfiguringSession(updateSelectedChannels),
      ),
    );

    // Verify the initial state of checkboxes
    expect(find.byType(Checkbox),
        findsNWidgets(5)); // Assuming there are 5 checkboxes in total

    // Tap on the first checkbox (Channel 1 EMG)
    await tester.tap(
        find.byType(Checkbox).at(0)); // Index 0 represents the first checkbox
    await tester.pump();

    // Verify that only the first checkbox is selected
    expect(
      tester.widget<Checkbox>(find.byType(Checkbox).at(0)).value,
      isTrue,
    );
    expect(
      tester.widget<Checkbox>(find.byType(Checkbox).at(1)).value,
      isFalse,
    );

    // Tap on the second checkbox (Channel 1 ECG)
    await tester.tap(
        find.byType(Checkbox).at(1)); // Index 1 represents the second checkbox
    await tester.pump();

    // Verify that only the second checkbox is selected
    expect(
      tester.widget<Checkbox>(find.byType(Checkbox).at(0)).value,
      isFalse,
    );
    expect(
      tester.widget<Checkbox>(find.byType(Checkbox).at(1)).value,
      isTrue,
    );
  });
}

// Mock function for updating selected channels
void updateSelectedChannels(String channel, String option) {}
