import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:autoaid/main.dart';

void main() {
  testWidgets('Login screen shows email and password fields', (
    WidgetTester tester,
  ) async {
    // Load the AutoAid app
    await tester.pumpWidget(AutoAidApp());

    // Check for email and password input fields
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
