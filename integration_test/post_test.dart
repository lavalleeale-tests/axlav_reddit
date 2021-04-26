import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:integration_test/integration_test.dart";
import 'package:axlav_reddit/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Navigate to Post', (WidgetTester tester) async {
    await tester.pumpWidget(AxlavRedditApp());
    await tester.pumpAndSettle(const Duration(milliseconds: 10000));

    expect(find.byType(Card), findsWidgets);

    await tester.tap(find.byType(Card).first);
    await tester.pumpAndSettle();

    expect(find.byType(Card), findsOneWidget);
  });
}
