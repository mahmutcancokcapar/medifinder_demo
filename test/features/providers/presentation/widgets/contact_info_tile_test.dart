import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:medifinder_demo/core/theme/app_theme.dart';
import 'package:medifinder_demo/features/providers/presentation/widgets/contact_info_tile.dart';

void main() {
  Widget createWidgetUnderTest({VoidCallback? onTap}) {
    return MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(
        body: ContactInfoTile(
          icon: Icons.phone,
          title: 'Phone',
          value: '+1 234 567 890',
          onTap: onTap,
        ),
      ),
    );
  }

  testWidgets('ContactInfoTile displays title, value and icon', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Phone'), findsOneWidget);
    expect(find.text('+1 234 567 890'), findsOneWidget);
    expect(find.byIcon(Icons.phone), findsOneWidget);
  });

  testWidgets('ContactInfoTile shows chevron when onTap is provided',
      (tester) async {
    await tester.pumpWidget(createWidgetUnderTest(onTap: () {}));

    // Should find the primary icon and the chevron right icon
    expect(find.byIcon(Icons.chevron_right_rounded), findsOneWidget);
  });

  testWidgets('ContactInfoTile hides chevron when onTap is null',
      (tester) async {
    await tester.pumpWidget(createWidgetUnderTest(onTap: null));

    expect(find.byIcon(Icons.chevron_right_rounded), findsNothing);
  });

  testWidgets('ContactInfoTile calls onTap when tapped', (tester) async {
    var isTapped = false;

    await tester.pumpWidget(
      createWidgetUnderTest(
        onTap: () {
          isTapped = true;
        },
      ),
    );

    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    expect(isTapped, true);
  });
}
