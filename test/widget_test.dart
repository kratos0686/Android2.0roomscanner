import 'package:flutter_test/flutter_test.dart';
import 'package:room_scanner/main.dart';

void main() {
  testWidgets('App initializes and shows home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RoomScannerApp());

    // Verify that the app title appears
    expect(find.text('Room Scanner'), findsOneWidget);

    // Verify welcome message
    expect(find.text('Welcome to Room Scanner'), findsOneWidget);

    // Verify scan button exists
    expect(find.text('Start Scanning'), findsOneWidget);
  });
}
