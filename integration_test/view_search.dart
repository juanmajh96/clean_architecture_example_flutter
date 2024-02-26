import 'package:automatitation/main.dart' as app;
import 'package:automatitation/src/search/screen/screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Testing App', () {
    testWidgets('ViewSearch operations test', (tester) async {
      //Open App
      app.main();
      await tester.pumpAndSettle();
      //Assert ViewSearch
      expect(find.byType(ViewSearch), findsOneWidget);
      //Wait Futures been complete
      await tester.pumpAndSettle(const Duration(seconds: 2));
      //Assert RequestFuture & RequestStream
      expect(find.text('1'), findsAtLeast(2));
    });
  });
}
