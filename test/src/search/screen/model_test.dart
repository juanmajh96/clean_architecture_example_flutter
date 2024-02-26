import 'package:automatitation/src/search/screen/screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ModelSearch Test', () {
    test('Two instances with the same properties should be equal', () {
      // Arrange
      const model1 = ModelSearch();
      const model2 = ModelSearch();

      // Act & Assert
      expect(model1, equals(model2));
    });

    test('Instances with different properties should not be equal', () {
      // Arrange
      const model1 = ModelSearch();
      const model2 = ModelSearch(
        textIsFailure: 'DifferentFailure',
        textIsSuccesful: 'DifferentSuccess',
        textIsLoading: 'DifferentLoading',
        textFromFuture: 'DifferentFuture',
        textFromStream: 'DifferentStream',
      );

      // Act & Assert
      expect(model1, isNot(equals(model2)));
    });

    test('hashCode should be the same for equal instances', () {
      // Arrange
      const model1 = ModelSearch();
      const model2 = ModelSearch();

      // Act & Assert
      expect(model1.hashCode, equals(model2.hashCode));
    });

    test('hashCode should be different for instances with different properties', () {
      // Arrange
      const model1 = ModelSearch();
      const model2 = ModelSearch(
        textIsFailure: 'DifferentFailure',
        textIsSuccesful: 'DifferentSuccess',
        textIsLoading: 'DifferentLoading',
        textFromFuture: 'DifferentFuture',
        textFromStream: 'DifferentStream',
      );

      // Act & Assert
      expect(model1.hashCode, isNot(equals(model2.hashCode)));
    });
  });
}
