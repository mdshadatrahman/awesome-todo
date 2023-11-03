import 'package:awesome_todo/app/app.dart';
import 'package:awesome_todo/modules/todo/screens/todo_home_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(TodoHomeView), findsOneWidget);
    });
  });
}
