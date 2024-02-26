import 'package:automatitation/src/search/screen/blocs/blocs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EventShowFuture Comparison Test', () {
    test('Instances should support equality comparisons', () {
      // Arrange
      final event1 = EventShowFuture(request: 'example');
      final event2 = EventShowFuture(request: 'example');

      // Act & Assert
      expect(event1 == event2, true);
    });

    test('Instances should support inequality comparisons', () {
      // Arrange
      final event1 = EventShowFuture(request: 'example');
      final event2 = EventShowFuture(request: 'different_example');

      // Act & Assert
      expect(event1 != event2, true);
    });
  });
}
