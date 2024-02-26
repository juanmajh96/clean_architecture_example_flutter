import 'package:automatitation/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ObjectLetExtension Test', () {
    test('let should apply callback correctly', () {
      // Arrange
      const value = 42;
      // Act
      final result = value.let((self) {
        // Assert
        expect(self, equals(value));
        return self * 2;
      });

      // Assert
      expect(result, equals(84));
    });
  });
}
