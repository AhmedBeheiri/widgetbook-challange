import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/app.dart';
import 'package:widgetbook_challenge/features/home/presentation/widgets/home_widget.dart';
import 'package:widgetbook_challenge/injection_container.dart' as di;

void main() {
  di.configureInjection();
  testWidgets('HomeWidget', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.byType(HomeWidget), findsOneWidget);
  });
}
