import 'package:automatitation/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Exception Tests', () {
    test('ServerException should extend Equatable and Exception', () {
      //Arrange
      const serverException = ServerException();

      // Act & Assert
      expect(serverException, isA<Equatable>());
      expect(serverException, isA<Exception>());
      expect(serverException.props, isEmpty);
    });

    test('CacheException should extend Equatable and Exception', () {
      //Arrange
      const cacheException = CacheException();
      // Act & Assert
      expect(cacheException, isA<Equatable>());
      expect(cacheException, isA<Exception>());
      expect(cacheException.props, isEmpty);
    });

    test('AppException should extend Equatable and Exception', () {
      //Arrange
      const appException = AppException();
      // Act & Assert
      expect(appException, isA<Equatable>());
      expect(appException, isA<Exception>());
      expect(appException.props, isEmpty);
    });

    test('Exception objects should be comparable', () {
      //Arrange
      const serverException1 = ServerException();
      const serverException2 = ServerException();

      const cacheException1 = CacheException();
      const cacheException2 = CacheException();

      const appException1 = AppException();
      const appException2 = AppException();
      // Act & Assert
      expect(serverException1, equals(serverException2));
      expect(cacheException1, equals(cacheException2));
      expect(appException1, equals(appException2));
    });
  });
}
