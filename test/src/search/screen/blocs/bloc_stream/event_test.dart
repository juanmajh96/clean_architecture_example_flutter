import 'package:automatitation/src/search/screen/blocs/blocs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EventShowFuture Comparison Test', () {
    test('Instances should support equality comparisons', () {
      // Arrange
      final event1 = EventShowStream();
      final event2 = EventShowStream();

      // Act & Assert
      expect(event1 == event2, true);
    });
  });
}
