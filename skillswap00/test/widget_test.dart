import 'package:flutter_test/flutter_test.dart';
import 'package:skillswap00/main.dart';

void main() {
  testWidgets('SkillSwapApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SkillSwapApp());
    expect(find.byType(SkillSwapApp), findsOneWidget);
  });
}
