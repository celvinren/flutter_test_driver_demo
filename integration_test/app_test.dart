import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_driver_demo/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab);
      await Future.delayed(const Duration(seconds: 1));

      await tester.tap(fab);
      await Future.delayed(const Duration(seconds: 1));

      await tester.tap(fab);
      await Future.delayed(const Duration(seconds: 1));

      await tester.tap(fab);
      await Future.delayed(const Duration(seconds: 1));

      await tester.tap(fab);
      await Future.delayed(const Duration(seconds: 1));

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('5'), findsOneWidget);

      await Future.delayed(const Duration(seconds: 10));
    });
  });
}
