import 'package:axlav_reddit/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Authenticate Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(AxlavRedditApp());
    await tester.pump();
    expect(find.text("Login"), findsNothing);
    expect(find.text("Logout"), findsNothing);
    expect(find.byIcon(Icons.account_circle), findsOneWidget);
    await tester.tap(find.byIcon(Icons.account_circle));
    await tester.pump();
    expect(find.text("Login"), findsOneWidget);
    expect(find.text("Logout"), findsOneWidget);
    await tester.tap(find.byIcon(Icons.account_circle));
    await tester.pump();
    expect(find.text("Login"), findsNothing);
    expect(find.text("Logout"), findsNothing);
  });
}
